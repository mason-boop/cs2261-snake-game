#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "apple.h"

// Snake variables
SNAKE snake[MAXSNAKE];
int snakeLength;
int snakeCount;

// Apple variables
APPLE apples[APPLECOUNT];
int applesRemaining;
int appleCount;
int score;

// Direction variable
int direction;
int oldDirection;

// Initialize the game
void initGame() {

    initSnake();
    initApples();

    // Initialize variables
    score = 0;
    snakeLength = 0;
    direction = 0;
    oldDirection = 0;
    appleCount = 0;
    snakeCount = 0;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &applePal, PALETTE, 256);

    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256 - NUMCOLORS + i] = colors[i];
    }
}

// Updates the game each frame
void updateGame() {

    updateSnake();

    // Update all the balls
    for (int i = 0; i < APPLECOUNT; i++) {
        updateApple(&apples[i]);
    }

    snakeCount++;
    appleCount++;
}

// Draws the game each frame
void drawGame() {

    fillScreen4(BLACKID);
    drawBar();

    for (int i = 0; i < MAXSNAKE; i++) {
        drawSnake(&snake[i]);
    }

    // Draw all the apples
    for (int i = 0; i < APPLECOUNT; i++) {
        drawApple(&apples[i]);
    }
}

// Draws the bar protecting the score
void drawBar() {

    drawRect4(135, 3, 2, 234, WHITEID);
}

// Initialize the snake
void initSnake() {

    // Initialize all snake bits
    for (int i = 0; i < MAXSNAKE; i++) {
        snake[i].row = 160 / 2;
        snake[i].col = 240 / 2 + snake[i].width * i;
        snake[i].rdel = 9;
        snake[i].cdel = 9;
        snake[i].height = 9;
        snake[i].width = 9;
        snake[i].active = 0;
        snake[i].color = GREENID;
        snake[i].collide = 0;
    }

    // Activate initial snake (length 3)
    snake[0].active = 1;
    snakeLength++;
}

// Handle every-frame actions of the snake
void updateSnake() {

    if (snakeCount == 9) {
        // Make snake move
        for (int i = snakeLength; i >= 0; i--) {

            // Update body of snake
            if (i > 0) {
                snake[i].row = snake[i - 1].row;
                snake[i].col = snake[i - 1].col;
            }

            // Update head
            if (i == 0) {
                switch(direction) {

                case STOP:
                    break;
                case UP:
                    snake[i].row -= snake[i].rdel;
                    oldDirection = UP;
                    break;
                case DOWN:
                    snake[i].row += snake[i].rdel;
                    oldDirection = DOWN;
                    break;
                case LEFT:
                    snake[i].col -= snake[i].cdel;
                    oldDirection = LEFT;
                    break;
                case RIGHT:
                    snake[i].col += snake[i].cdel;
                    oldDirection = RIGHT;
                    break;
                }

                for (int j = snakeLength; j > 0; j--) {
                    // Handle collisions with snake
                    if (snakeLength > 1 && collision(snake[0].row, snake[0].col,
                        snake[0].height, snake[0].width, snake[j].row, snake[j].col,
                        snake[j].height, snake[j].width)) {
                        snake[0].collide = 1;
                    }
                }
            }
        }

        snakeCount = 0;
    }

    // Set snake direction
    if (BUTTON_PRESSED(BUTTON_LEFT)
        && oldDirection != RIGHT) {
        direction = LEFT;

    } else if (BUTTON_PRESSED(BUTTON_RIGHT)
        && oldDirection != LEFT) {
        direction = RIGHT;

    } else if (BUTTON_PRESSED(BUTTON_UP)
        && oldDirection != DOWN) {
        direction = UP;

    } else if (BUTTON_PRESSED(BUTTON_DOWN)
        && oldDirection != UP) {
        direction = DOWN;
    }

    // Handle collisions with the wall
    // Top
    // Left
    // Right
    // Bottom
    if (snake[0].row < -1) {
        snake[0].collide = 1;
    } else if (snake[0].col < 0) {
        snake[0].collide = 1;
    } else if (snake[0].col + snake[0].width >= SCREENWIDTH) {
        snake[0].collide = 1;
    } else if (snake[0].row + snake[0].height >= 135) {
        snake[0].collide = 1;
    }
}

// Draw the snake
void drawSnake(SNAKE* s) {

    if (s-> active) {
        drawRect4(s->row, s->col, s->height, s->width, s->color);
    }
}

// Initialize the balls
void initApples() {

    // Random function in the range [min, max):
    // (rand() % (max - min)) + min

    for (int i = 0; i < APPLECOUNT; i++) {

        apples[i].height = 12;
        apples[i].width = 12;
        apples[i].row = 0;
        apples[i].col = 0;
        apples[i].rdel = 2;
        apples[i].cdel = 0;
        apples[i].active = 0;
    }
}

// Handle every-frame actions of a ball
void updateApple(APPLE* a) {

    if (appleCount == 50) {
        for (int i = 0; i < APPLECOUNT; i++) {
            if (!a->active) {

                // Position the new apple
                a->row = (rand() % (123 - 12)) + 12;
                a->col = (rand() % (228 - 12)) + 12;

                // Take apple out of the pool
                a->active = 1;

                // Break out of the loop
                break;
            }
        }

        appleCount = 0;
    }

    if (a->active) {

        // Handle apple/snake collision
        for (int i = 0; i < MAXSNAKE; i++) {

            if (snake[i].active && collision(a->row, a->col,a->height, a->width,
                snake[i].row, snake[i].col, snake[i].height, snake[i].width) != 0) {

                score++;
                snake[snakeLength++].active = 1;
                a->active = 0;
            }
        }
    }
}

// Draw a ball
void drawApple(APPLE* a) {

    if(a->active) {
        drawImage4(a->row, a->col, a->height, a->width, appleBitmap);
    }
}