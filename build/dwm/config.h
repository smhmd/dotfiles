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
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = { "monospace:size=9" };
static const char dmenufont[]       = "monospace:size=9";
static const char col_gray1[]       = "#373b41";
static const char col_gray2[]       = "#333333";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#ccc";
static const char col_primary[]     = "#1d1f21";
static const char col_active[]      = "#bbb";
static const char col_inactive[]    = "#333";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_inactive },
	[SchemeSel]  = { col_gray4, col_primary,  col_active  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
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
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_primary, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *lf[]  = { "st", "lf", NULL };

static Key keys[] = {
	/* modifier                     key              function        argument */
	{ MODKEY|ShiftMask,  		XK_q,            quit,           {0} },
	{ MODKEY,                       XK_b,            togglebar,      {0} },
	{ ALTKEY,                    	XK_Tab,          focusstack,     {.i = +1 } },
	{ ALTKEY|ShiftMask,          	XK_Tab,          focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,            incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,            incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,            setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_k,            setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return,       zoom,           {0} },
	{ MODKEY,                       XK_Tab,          view,           {0} },
	{ MODKEY,             		XK_q,            killclient,     {0} },
	{ MODKEY,                       XK_t,            setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,            setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,            setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,        setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,        togglefloating, {0} },
	{ MODKEY,                       XK_parenright,   view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_parenright,   tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,        focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,       focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,        tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,       tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,        setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,        setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_equal,        setgaps,        {.i = 0  } },

	{ MODKEY,	                XK_Return, 	 spawn,          {.v = termcmd } },
	{ MODKEY,                    	XK_d,      	 spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_e,            spawn,          {.v = lf } },
	{ MODKEY,                       XK_l,            spawn,          SHCMD("slock") },
	{ 0,                            0x1008FF18,      spawn,          SHCMD("chromium") },
	{ ShiftMask,	               	0x1008FF18,	 spawn,          SHCMD("chromium --incognito") },
	{ 0,	                	0x1008ff1d,	 spawn,          SHCMD("code") },
	{ 0,                         	0x1008FF13,	 spawn,          SHCMD("pactl set-sink-volume 0 +5%") }, // vol up 5
	{ 0,                         	0x1008FF11,	 spawn,          SHCMD("pactl set-sink-volume 0 -5%") }, // vol down 5
	{ 0,                         	0x1008FF12,	 spawn,          SHCMD("mpc toggle") }, // toggle play pause
	{ 0,                         	0x1008FF02,	 spawn,          SHCMD("xbacklight -inc 10") }, // increase volume
	{ 0,                         	0x1008FF03,	 spawn,          SHCMD("xbacklight -dec 10") }, // decrease volume
	{ 0,                         	0x1008ff59,	 spawn,          SHCMD("imgur-screenshot") }, // take screenshot and upload to imgur

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

