#include <stdio.h>
#include <math.h>
#define pi 3.14

typedef struct{
	float x;
	float y;
} point;
    
typedef struct{
	point center;
	float r;
} circle;

typedef struct{
	point a;
	point b;
	point c;
} triangle;

int main()
{
    int z;
    start:
    printf("1-crerate cricle\n2-create triangle\nanything else-exit programm\n");
    scanf("%d", &z);
	
	if (z==1)
	{
		circle c;
		
		printf("input center coordinates: ");
		scanf("%f%f", &c.center.x, &c.center.y);
		printf("input radius length: ");
		scanf("%f", &c.r);
		
		float perimeter=2*pi*c.r;
		float area=pi*c.r*c.r;
		
		printf("perimeter = %f\narea = %f\n", perimeter, area);
		goto start;
	}
	
	if (z==2)
	{
		triangle t;
		
		printf("input edges' coordinates:\na ");
		scanf("%f%f", &t.a.x, &t.a.y);
		printf("\nb: ");
		scanf("%f%f", &t.b.x, &t.b.y);
		printf("\nc: ");
		scanf("%f%f", &t.c.x, &t.c.y);
		
		if (((t.a.x==t.b.x)&&(t.a.x==t.c.x)) || ((t.a.y==t.b.y)&&(t.a.y==t.c.y)))
		{
			printf("this is not a triangle");
		}
		else
		{
		float ab=sqrt(pow(t.a.x-t.b.x, 2)+pow(t.a.y-t.b.y, 2));
		float ac=sqrt(pow(t.a.x-t.c.x, 2)+pow(t.a.y-t.b.y, 2));
		float bc=sqrt(pow(t.b.x-t.c.x, 2)+pow(t.b.y-t.c.y, 2));
		
		float p=ab+ac+bc;
		
		float p2=p/2;
		
		float area=sqrt(p2*(p2-ab)*(p2-ac)*(p2-bc));
		
		printf("perimeter= %f\narea= %f\n", p, area);
		
		goto start;
		}
	}
    return 0;
}
