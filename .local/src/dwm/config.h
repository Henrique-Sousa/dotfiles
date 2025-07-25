

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
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
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define PrintScreenDWM	    0x0000ff61

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *screenshot[]  = { "scrot", "dwnlds/screenshots/%Y-%m-%d-%H%M%S.png", NULL };
static const char *screenshots_region[]  = { "scrot", "-s", "dwnlds/screenshots/%Y-%m-%d-%H%M%S.png", NULL };
static const char *suspendcmd[]  = {"/home/user1/.local/bin/suspend.sh", NULL };

/* sound */
/*
static const char *up_vol[]       = { "/usr/bin/pactl", "set-sink-volume", "1", "+5%",     NULL };
static const char *down_vol[]     = { "/usr/bin/pactl", "set-sink-volume", "1", "-5%",     NULL };
static const char *default_vol[]  = { "/usr/bin/pactl", "set-sink-volume", "1", "100%",    NULL };
static const char *mute_vol[]     = { "/usr/bin/pactl", "set-sink-mute",   "1", "toggle",  NULL };
*/
static const char *up_vol[]         = { "/home/user1/.local/bin/audio/up_vol.sh",       NULL };
static const char *down_vol[]       = { "/home/user1/.local/bin/audio/down_vol.sh",     NULL };
static const char *default_vol[]    = { "/home/user1/.local/bin/audio/default_vol.sh",  NULL };
static const char *mute_vol[]       = { "/home/user1/.local/bin/audio/mute_vol.sh",     NULL };
static const char *laptop_audio[]   = { "/home/user1/.local/bin/audio/laptop_audio.sh", NULL };
static const char *hdmi_audio[]     = { "/home/user1/.local/bin/audio/hdmi_audio.sh",   NULL };

/* keyboard layout */
//static const char *ch_kb_layout[] = { "/home/user1/toggle_keyboard_layout.sh", NULL };
static const char *toggle_keyb[] = { "/home/user1/.local/bin/toggle_keyboard_layout.sh", NULL };
static const char *gr_keyb[] = { "setxkbmap", "gr", "-variant", "polytonic",    NULL };
static const char *ru_keyb[] = { "setxkbmap", "us", "-variant", "rus",          NULL };

static const Key keys[] = {
	/* modifier                     key             function        argument */
	{ MODKEY,                       XK_p,           spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return,      spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,           togglebar,      {0} },
	{ MODKEY,                       XK_j,           focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,           focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,           incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,           incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,           setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,           setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,         view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,           killclient,     {0} },
	{ MODKEY,                       XK_t,           setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,           setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,           setlayout,      {.v = &layouts[2]} },
	//{ MODKEY,                       XK_space,       setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,       togglefloating, {0} },
	{ MODKEY,                       XK_0,           view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,           tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,       focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,      focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,       tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,      tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_q,           quit,           {0} },
    { MODKEY,                       XK_minus,       spawn,          {.v = down_vol } },
	{ MODKEY,                       XK_equal,       spawn,          {.v = up_vol } },
	{ MODKEY|ShiftMask,             XK_minus,       spawn,          {.v = default_vol } },
	{ MODKEY|ShiftMask,             XK_equal,       spawn,          {.v = mute_vol } },
	{ MODKEY,                       XK_F9,          spawn,          {.v = laptop_audio } },
	{ MODKEY|ShiftMask,             XK_F9,          spawn,          {.v = hdmi_audio } },
    { 0,                            PrintScreenDWM, spawn,          {.v = screenshot } },
    { 0     |ShiftMask,             PrintScreenDWM, spawn,          {.v = screenshots_region } },
    { MODKEY,                       XK_s,           spawn,          {.v = suspendcmd } },
	{ MODKEY,                       XK_space,       spawn,          {.v = toggle_keyb } },
	{ MODKEY,                       XK_g,           spawn,          {.v = gr_keyb } },
	{ MODKEY,                       XK_r,           spawn,          {.v = ru_keyb } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
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
