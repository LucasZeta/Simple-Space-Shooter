/*
Hello world!
*/
#include "eth_util.angelscript"
#include "isPointInRect.angelscript"

void main()
{
    LoadScene("scenes/menu.esc");

    // Prefer setting window properties in the app.enml file
    // SetWindowProperties("Ethanon Engine", 1024, 768, true, true, PF32BIT);
}

void onGameSceneLoaded()
{
    LoadSoundEffect("soundfx/shoot.mp3");

    LoadMusic("soundfx/soundtrack.mp3");
    LoopSample("soundfx/soundtrack.mp3", true);

    PlaySample("soundfx/soundtrack.mp3");
}

void ETHCallback_spaceship(ETHEntity@ thisEntity)
{
    ETHInput@ input = GetInputHandle();
    float speed = UnitsPerSecond(120.0f);

    if (input.KeyDown(K_RIGHT))
        thisEntity.AddToPositionXY(vector2(1.0f, 0.0f) * speed);

    if (input.KeyDown(K_LEFT))
        thisEntity.AddToPositionXY(vector2(-1.0f, 0.0f) * speed);

    if (input.KeyDown(K_UP))
        thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);

    if (input.KeyDown(K_DOWN))
        thisEntity.AddToPositionXY(vector2(0.0f, 1.0f) * speed);

    if (input.GetKeyState(K_SPACE) == KS_HIT)
    {
        AddEntity("shot.ent",thisEntity.GetPosition());
        PlaySample("soundfx/shoot.mp3");
    }
}

void ETHCallback_shot(ETHEntity@ thisEntity)
{
    float speed = UnitsPerSecond(360.0f);
    thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);

    if (thisEntity.GetPosition().y < 0.0f)
    {
        DeleteEntity(thisEntity);
    }
}

void ETHCallback_start_button(ETHEntity@ thisEntity)
{
    vector2 size = thisEntity.GetSize();

    ETHInput@ input = GetInputHandle();

    if (input.GetTouchState(0) == KS_HIT)
    {
        if (isPointInRect(input.GetTouchPos(0), thisEntity.GetPositionXY(), size, vector2(0.5f, 0.5f)))
        {
            LoadScene("scenes/game.esc", "onGameSceneLoaded");
        }
    }
}