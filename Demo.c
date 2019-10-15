
//includes
#include <SDL2/SDL.h>

//defines
#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 360
//datatypes
typedef struct {
	float m[9];
} matrix;
//global variables we need
//The window we'll be rendering to
SDL_Window* window = NULL;
//The surface contained by the window
SDL_Surface* screenSurface = NULL;

float cameraRot[3][3] = {{1.0f,0.0f,0.0f},{0.0f,1.0f,0.0f},{0.0f,0.0f,1.0f}};


int SDL_INIT() {
	//Initialization flag
	int success = 1;
	//Initialize SDL
	if( SDL_Init( SDL_INIT_VIDEO ) < 0 ) {
		printf( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
		success = 0;
	} else {
		//Create window
		window = SDL_CreateWindow( "VM", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
		if( window == NULL ) {
			printf( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
			success = 0;
		} else {
			//Get window surface
			screenSurface = SDL_GetWindowSurface( window );
		}
	}
	SDL_PixelFormat *fmt;
	fmt = screenSurface->format;
	if(fmt->BytesPerPixel != 4) {
		printf("error: wrong pixel format\n");
		success = 0;
	} else if(fmt->Rmask != 0x00ff0000) {
		printf("error: wrong Rmask\n");
		success = 0;
	} else if(fmt->Gmask != 0x0000ff00) {
		printf("error: wrong Gmask\n");
		success = 0;
	} else if(fmt->Bmask != 0x000000ff) {
		printf("error: wrong Bmask\n");
		success = 0;
	}


	return success;
}

void SDL_CLOSE() {
	//save screenshot
	SDL_SaveBMP( screenSurface, "screenshot.bmp" );
	//Destroy window
	SDL_DestroyWindow( window );
	window = NULL;
	//Quit SDL subsystems
	SDL_Quit();
}

int main( int argc, char* argv[] )
{
	SDL_INIT();
	LoadTestModel( triangles );
	screen = InitializeSDL( SCREEN_WIDTH, SCREEN_HEIGHT );
	t = SDL_GetTicks();	// Set start value for timer.
	memcpy(&cameraRot, &normalMatrix3x3, sizeof(normalMatrix3x3));
	while( NoQuitMessageSDL() )
	{
		Update();
		Draw();
	}

	SDL_CLOSE();
	return 0;
}

void Update()
{
	// Compute frame time:
	int t2 = SDL_GetTicks();
	float dt = float(t2-t);
	t = t2;
	cout << "Render time: " << dt << " ms." << endl;

	Uint8* keystate = SDL_GetKeyState(0);


	int dx;
	int dy;
	SDL_GetRelativeMouseState( &dx, &dy );
	//yaw += (float)dx/100.0;

	cameraRot[0][0] = cos(yaw); cameraRot[0][1] = 0.0; cameraRot[0][2] = sin(yaw);
	cameraRot[1][0] = 0.0; cameraRot[1][1] = 1.0; cameraRot[1][2] = 0.0;
	cameraRot[2][0] = -sin(yaw); cameraRot[2][1] = 0.0; cameraRot[2][2] =cos(yaw);
	mat3 movementRot;
	movementRot[0][0] = cos(-yaw); movementRot[0][1] = 0.0; movementRot[0][2] = sin(-yaw);
	movementRot[1][0] = 0.0; movementRot[1][1] = 1.0; movementRot[1][2] = 0.0;
	movementRot[2][0] = -sin(-yaw); movementRot[2][1] = 0.0; movementRot[2][2] =cos(-yaw);
	if( keystate[SDLK_UP] )
		;

	if( keystate[SDLK_DOWN] )
		;

	if( keystate[SDLK_RIGHT] )
		;

	if( keystate[SDLK_LEFT] )
		;

	if( keystate[SDLK_RSHIFT] )
		;

	if( keystate[SDLK_RCTRL] )
		;

	if( keystate[SDLK_w] )
		//cameraPos += (vec3(0,0,0.01) * movementRot);
		lightPos +=  (vec3(0,0,0.01) * movementRot);

	if( keystate[SDLK_s] )
		//cameraPos += (vec3(0,0,-0.01) * movementRot);
		lightPos += (vec3(0,0,-0.01) * movementRot);

	if( keystate[SDLK_d] )
		//cameraPos += (vec3(0.01,0,0) * movementRot);
		lightPos += (vec3(0.01,0,0) * movementRot);

	if( keystate[SDLK_a] )
		//cameraPos += (vec3(-0.01,0,0) * movementRot);
		lightPos += (vec3(-0.01,0,0) * movementRot);

	if( keystate[SDLK_e] )
		;

	if( keystate[SDLK_q] )
		;


}

void Draw()
{
	SDL_FillRect( screen, 0, 0 );

	//reset depth-Buffer
		for(int y = 0; y < SCREEN_HEIGHT; ++y) {
			for(int x = 0; x < SCREEN_WIDTH; ++x) {
				depthBuffer[y][x] = 0;
			}
		}

	if( SDL_MUSTLOCK(screen) )
		SDL_LockSurface(screen);

	for( int i=0; i<triangles.size(); ++i )
	{
		vector<Vertex> vertices(3);
		vertices[0].position = triangles[i].v0;
		vertices[1].position = triangles[i].v1;
		vertices[2].position = triangles[i].v2;

		vec3 normal = calcNormal(triangles[i].v0, triangles[i].v1, triangles[i].v2);
		//vertices[0].normal = normal;
		//vertices[1].normal = normal;
		//vertices[2].normal = normal;

		//vertices[0].reflectance = triangles[i].color;
		//vertices[1].reflectance = triangles[i].color;
		//vertices[2].reflectance = triangles[i].color;
		currentNormal = normal;
		currentReflectance = triangles[i].color;

		//Draw Polygons, Depth-Buffered, shaded
		DrawPolygon_db2(vertices);

		/*
		//simple vertices
		vector<vec3> vertices(3);
		vertices[0] = triangles[i].v0;
		vertices[1] = triangles[i].v1;
		vertices[2] = triangles[i].v2;
		*/
		/*
		//Draw Polygons, Depth-Buffered
		currentColor = triangles[i].color;
		DrawPolygon_db(vertices);
		*/
		/*
		//Draw Polygons
		currentColor = triangles[i].color;
		DrawPolygon(vertices);
		*()
		/*
		//Draw Lines
		DrawPolygonEdges (vertices );
		*/
		/*
		//Draw Points
		for(int v=0; v < 3; ++v) {
			ivec2 projPos;
			VertexShader( vertices[v], projPos);
			vec3 color(1,1,1);
			PutPixelSDL( screen, projPos.x, projPos.y, color );

		}*/
	}

	if ( SDL_MUSTLOCK(screen) )
		SDL_UnlockSurface(screen);

	SDL_UpdateRect( screen, 0, 0, 0, 0 );
}
