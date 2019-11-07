// Player Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int collide;
	int active;
	unsigned char color;
} SNAKE;

// Apple Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
} APPLE;

// Constants
#define APPLECOUNT 1
#define MAXSNAKE 200

// Snake variables
extern SNAKE snake[MAXSNAKE];
extern int snakeLength;
extern int snakeCount;

// Apple variables
extern APPLE apples[APPLECOUNT];
extern int applesRemaining;
extern int score;
extern int appleCount;

// Direction variables
enum {STOP, UP, DOWN, LEFT, RIGHT};
extern int direction;
extern int oldDirection;

// Custom Game Colors
#define NUMCOLORS 6
// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initSnake();
void updateSnake();
void drawSnake();
void initApples();
void updateApple(APPLE *);
void drawApple(APPLE *);