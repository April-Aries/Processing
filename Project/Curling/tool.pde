/* Tools */

import http.requests.*;

/* Fonts */
PFont TCfont;
PFont Noto;

/* Pictures */
PImage BG_home;
PImage BG_about;
PImage BG_tutorial;
PImage BG_rank;
PImage BG_end;
PImage Button_home;
PImage Button_start;
PImage Button_about;
PImage Button_ball;
PImage Button_rank;
PImage Button_exit;
PImage Button_tutorial;
PImage Button_rank_black;
PImage Button_ThatsMe;
PImage Button_backspace;

// TextBox
TEXTBOX nameTB;

// Page ID Preprocessing
int PAGE = 0;
final int PAGE_MIN = 0;
final int PAGE_HOME = 0;
final int PAGE_BALL = 1;
final int PAGE_RANKING = 2;
final int PAGE_ABOUT = 3;
final int PAGE_TUTORIAL = 4;
final int PAGE_GAME = 5;
final int PAGE_END = 6;
final int PAGE_MAX = 6;

// Rule ID Preprocessing
int RULE = 0;
int RULE_SCORE = 0;
int RULE_BID = 1;

// Ball ID
int BALL = 0;
int BALL_ID_MIN = 0;
int BALL_ID_MAX = 10; // TBD <---

// Ground ID
int GROUND = 0;
int GROUND_ID_MIN = 0;
int GROUND_ID_MAX = 10; // TBD <---

// Others
String CSV_link = "https://docs.google.com/spreadsheets/d/e/2PACX-1vRVTAsTF5gqPctmsIJy3eVvYDWQOdFt9bM90apoF_izoXSuv0vAWDkLox2aeC5k_q3WF4IdXztfxcq0/pub?gid=2040796872&single=true&output=csv&sheet=1";
int FRAMERATE = 60;
