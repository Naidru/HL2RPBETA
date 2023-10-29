local PLUGIN = PLUGIN

PLUGIN.name = "Spawn Notifications"
PLUGIN.description = "A notification which tells the player their status on loading the character."
PLUGIN.author = "Riggs Mackay"
PLUGIN.schema = "Any"
PLUGIN.license = [[
Copyright 2022 Riggs Mackay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- Feel free to change any of these messages.
local wakeupmessages = {
    "Xenian lightning flashes across the skies, the sound of vortigaunt chanting begins to urge you awake.",
    "Noises of gunfire, and the sound of the 7 Hour War echoes from the past. You wake up, uneasy.",
    "The sounds of stomping boot steps fills your ears, reminiscent of Combine troopers marching through the streets. It jolts you awake.",
    "A crackle of thunder and a green flash of light fills your vision, and forces you to open your eyes.",
    "You were having a nightmare, you woke up after being chased by a strange looking Xenian.",
    "You hear a small whisper in your ear, after that you hear loud footsteps fading away, you wake up being scared.",
    "Green lightning quakes across the skies, as you look up to see the portals flaring through the clouds.",
    "For a moment, you heard your family, and everything was normal.. But when you opened your eyes, you saw the wasteland before you.",
    "You hear a loud helicopter overhead of yourself and you instantly wake up.",
    "You heard a growling and you started to wake up, scared.",
    "You heard a loud siren and you are scared of the noise.",
    "The sounds of artillery fire and panicking soldiers from the past began to stir you awake.",
    "The sound of a ships' fog horn instantly wakes you up, you are drenched in sweat.",
    "The sound of Combine alarms ringing through the air scares you into awakening.",
    "Days from the city made you wake up, terrified you were about to be transferred again.",
    "Your eyes jolt awake as you hear a nearby xenian portal.",
    "You begin to feel uneasy as you could swear you heard a houndeyes' chirping somewhere.",
}

function PLUGIN:PlayerSpawn(ply)
    if not ( ply:IsValid() or ply:Alive() or ply:GetCharacter() ) then return end

    ply:ConCommand("play ambient/levels/city/citadel_cloudhit3.wav")
    ply:ScreenFade(SCREENFADE.IN, color_black, 3, 2)
    ply:ChatPrint(table.Random(wakeupmessages))
end
