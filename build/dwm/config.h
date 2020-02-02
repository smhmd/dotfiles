/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 5;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = { "Iosevka SS10 :size=9" };
static const char dmenufont[]       = "Iosevka SS10 :size=9";
static const char col_gray1[]       = "#32302f";
static const char col_gray2[]       = "#f2e5bc";
static const char col_gray3[]       = "#d5c4a1";
static const char col_primary[]     = "#282828";
static const char col_active[]      = "#f9f5d7";
static const char col_inactive[]    = "#282828";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_inactive },
	[SchemeSel]  = { col_gray2, col_primary,  col_active  },
};

/* tagging */
static const char *tags[] = { "⒈", "⒉", "⒊", "⒋", "⒌", "⒍", "⒎", "⒏", "⒐" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
   */
  /* class                        instance    title       tags mask     iscentered     isfloating   monitor */
	{ "St",                      NULL,       NULL,       0,            1,             0,           -1 },
	{ "qBittorrent",             NULL,       NULL,       0,            1,             0,           -1 },
	{ "Gimp",                    NULL,       NULL,       0,            0,             1,           -1 },
	{ "Electron",                NULL,       NULL,       0,            1,             1,           -1 },
	{ "Firefox",                 NULL,       NULL,       1 << 1,       0,             0,           -1 },
	{ "Chromium",                NULL,       NULL,       1 << 1,       0,             0,           -1 },
	{ "Google-chrome-unstable",  NULL,       NULL,       1 << 1,       0,             0,           -1 },
	{ "mpv",                     NULL,       NULL,       1 << 2,       0,             0,           -1 },
	{ "Zathura",                 NULL,       NULL,       1 << 3,       0,             0,           -1 },
	{ "code-oss",                NULL,       NULL,       1 << 0,       0,             0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[≣]",        tile },    /* first entry is default */
	{ "[▒]",        NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_primary, "-sf", col_gray2, NULL };
static const char *termcmd[]  = { "st", NULL };
// static const char *lf[]  = { "st", "lf", NULL };

static Key keys[] = {
	/* modifier                     key              function        argument */
	{ MODKEY|ShiftMask,         	  XK_q,            quit,           {0} },
	{ MODKEY,                       XK_b,            togglebar,      {0} },
	{ ALTKEY,                       XK_Tab,          focusstack,     {.i = +1 } },
	{ ALTKEY|ShiftMask,             XK_Tab,          focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,            incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,            incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,            setmfact,       {.f = -0.0025} },
	{ MODKEY|ShiftMask,             XK_k,            setmfact,       {.f = +0.0025} },
	{ MODKEY|ShiftMask,             XK_Return,       zoom,           {0} },
	{ MODKEY,                       XK_Tab,          view,           {0} },
	{ MODKEY,             		  XK_q,            killclient,     {0} },
	{ MODKEY,                       XK_t,            setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,            setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,            setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_KP_Enter,     setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_KP_Enter,     togglefloating, {0} },
	{ MODKEY,                       XK_parenright,   view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_parenright,   tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,        focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,       focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,        tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,       tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_KP_Multiply,    setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_KP_Divide,  setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_equal,        setgaps,        {.i = 0  } },

	TAGKEYS(                     	XK_exclam,       0)
	TAGKEYS(                     	XK_at,      	 1)
	TAGKEYS(                     	XK_numbersign,   2)
	TAGKEYS(                     	XK_dollar,       3)
	TAGKEYS(                     	XK_percent,      4)
	TAGKEYS(                     	XK_asciicircum,  5)
	TAGKEYS(                     	XK_ampersand,    6)
	TAGKEYS(                     	XK_asterisk,     7)
	TAGKEYS(                     	XK_parenleft,    8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

