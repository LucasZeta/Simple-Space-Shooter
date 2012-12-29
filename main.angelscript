/*
Hello world!
*/
#include "eth_util.angelscript"

void main()
{
    LoadScene("scenes/first_scene.esc", "", "");

    // Prefer setting window properties in the app.enml file
    // SetWindowProperties("Ethanon Engine", 1024, 768, true, true, PF32BIT);
}

void ETHCallback_spaceship(ETHEntity@ thisEntity)
{
    ETHInput@ input = GetInputHandle();

    if (input.KeyDown(K_RIGHT))
        thisEntity.AddToPositionXY(vector2(2.0f, 0.0f));

    if (input.KeyDown(K_LEFT))
        thisEntity.AddToPositionXY(vector2(-2.0f, 0.0f));

    if (input.KeyDown(K_UP))
        thisEntity.AddToPositionXY(vector2(0.0f,-2.0f));

    if (input.KeyDown(K_DOWN))
        thisEntity.AddToPositionXY(vector2(0.0f, 2.0f));
}