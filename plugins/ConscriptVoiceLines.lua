PLUGIN.name = "Conscript Voices"
PLUGIN.author = "Umbree"
PLUGIN.description = "Adds Conscript voice lines and what not. From Black Mesa and other sources."
PLUGIN.schema = "HL2 RP"
PLUGIN.license = [[
Copyright 2019-2020 DevAppeared

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- HECU --
-- firing --
	Schema.voices.Add("HECU", "contact", "Contact!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_1.ogg", false)
	Schema.voices.Add("HECU", "look out", "Shit look out!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_2.ogg", false)
	Schema.voices.Add("HECU", "target", "Target!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_3.ogg", false)
	Schema.voices.Add("HECU", "contact2", "Contact Contact!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_4.ogg", false)
	Schema.voices.Add("HECU", "contact3", "Contact!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_8.ogg", false)
	Schema.voices.Add("HECU", "contact4", "Contact Contact!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_12.ogg", false)
	Schema.voices.Add("HECU", "target2", "Target!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_5.ogg", false)
	Schema.voices.Add("HECU", "There2", "There! Right there!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_6.ogg", false)
	Schema.voices.Add("HECU", "Move in3", "Move in!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_7.ogg", false)
	Schema.voices.Add("HECU", "Move in4", "Move in!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_14.ogg", false)
	Schema.voices.Add("HECU", "Got nothing2", "You got nothing. Nothing!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_9.ogg", false)
	Schema.voices.Add("HECU", "Heads up", "Heads up!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_10.ogg", false)
	Schema.voices.Add("HECU", "Target3", "Target!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_11.ogg", false)
	Schema.voices.Add("HECU", "Ok go", "Ok go go!", "CourragatedDawn/Xtra/vo/bm_hecu/firing_13.ogg", false)
-- Announce Kill --
	Schema.voices.Add("HECU","holy shit","Holy shit!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_1.ogg",false)
	Schema.voices.Add("HECU","Got nothing","You got nothing!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_2.ogg",false)
	Schema.voices.Add("HECU","Got em","I think I got 'em!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_3.ogg",false)
	Schema.voices.Add("HECU","There","There, right there!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_4.ogg",false)
	Schema.voices.Add("HECU","Push","Push push push!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_5.ogg",false)
	Schema.voices.Add("HECU","Push2","Go! Go! Push push push!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_6.ogg",false)
	Schema.voices.Add("HECU","Go","Go!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_7.ogg",false)
	Schema.voices.Add("HECU","Move in2","Move in!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_8.ogg",false)
	Schema.voices.Add("HECU","Move in","Move in!","CourragatedDawn/Xtra/vo/bm_hecu/announcekill_9.ogg",false)
-- Death scream sounds --
	Schema.voices.Add("HECU","Scream1","Aahh!","CourragatedDawn/Xtra/vo/bm_hecu/die_01.ogg",false)
	Schema.voices.Add("HECU","Scream2","Brrh Baa!","CourragatedDawn/Xtra/vo/bm_hecu/die_02.ogg",false)
	Schema.voices.Add("HECU","Scream3","AAAAHH!","CourragatedDawn/Xtra/vo/bm_hecu/die_03.ogg",false)
	Schema.voices.Add("HECU","Scream4","AH HAAOOH!","CourragatedDawn/Xtra/vo/bm_hecu/die_04.ogg",false)
	Schema.voices.Add("HECU","Scream5","GAH HAAOOH!","CourragatedDawn/Xtra/vo/bm_hecu/die_05.ogg",false)
	Schema.voices.Add("HECU","Scream6","HWHOooH!","CourragatedDawn/Xtra/vo/bm_hecu/die_06.ogg",false)
	Schema.voices.Add("HECU","Scream7","HRMMMHE!","CourragatedDawn/Xtra/vo/bm_hecu/die_07.ogg",false)
	Schema.voices.Add("HECU","Scream8","HAAHh!","CourragatedDawn/Xtra/vo/bm_hecu/die_08.ogg",false)
	Schema.voices.Add("HECU","Scream9","HRGh MRG MRAG!","CourragatedDawn/Xtra/vo/bm_hecu/die_09.ogg",false)
	Schema.voices.Add("HECU","Scream10","GRREAH!","CourragatedDawn/Xtra/vo/bm_hecu/die_10.ogg",false)
-- Grenade --
	Schema.voices.Add("HECU","Frag out","Frag out!","CourragatedDawn/Xtra/vo/bm_hecu/grenade_1.ogg",false)
	Schema.voices.Add("HECU","I got something","I got something for ya.","CourragatedDawn/Xtra/vo/bm_hecu/grenade_2.ogg",false)
	Schema.voices.Add("HECU","Get down","Everybody get down!","CourragatedDawn/Xtra/vo/bm_hecu/grenade_3.ogg",false)
	Schema.voices.Add("HECU","Frag out2","Watch out guys, frag out!","CourragatedDawn/Xtra/vo/bm_hecu/grenade_4.ogg",false)
-- Pain --
	Schema.voices.Add("HECU","Pain1","Argh!","CourragatedDawn/Xtra/vo/bm_hecu/pain_1.ogg",false)
	Schema.voices.Add("HECU","Pain2","Ergh, aw Frg!","CourragatedDawn/Xtra/vo/bm_hecu/pain_2.ogg",false)
	Schema.voices.Add("HECU","Pain3","AWUGH, Hraah houh!","CourragatedDawn/Xtra/vo/bm_hecu/pain_3.ogg",false)
	Schema.voices.Add("HECU","Pain4","AWUGH, Arghh god damnit!","CourragatedDawn/Xtra/vo/bm_hecu/pain_4.ogg",false)
	Schema.voices.Add("HECU","Shit2","Shit shit shit!","CourragatedDawn/Xtra/vo/bm_hecu/pain_5.ogg",false)
	Schema.voices.Add("HECU","Shit","Shit!","CourragatedDawn/Xtra/vo/bm_hecu/pain_6.ogg",false)
	Schema.voices.Add("HECU","Pain5","Argh, Shit!","CourragatedDawn/Xtra/vo/bm_hecu/pain_7.ogg",false)
	Schema.voices.Add("HECU","Pain6","Arg, hmf!","CourragatedDawn/Xtra/vo/bm_hecu/pain_8.ogg",false)
	Schema.voices.Add("HECU","Pain7","AgHh!","CourragatedDawn/Xtra/vo/bm_hecu/pain_9.ogg",false)
	Schema.voices.Add("HECU","Pain8","Ough!","CourragatedDawn/Xtra/vo/bm_hecu/pain_10.ogg",false)
-- Panic --
	Schema.voices.Add("HECU","Shit contact","Shit, contact!","CourragatedDawn/Xtra/vo/bm_hecu/panic_1.ogg",false)
	Schema.voices.Add("HECU","help","Somebody, help me!","CourragatedDawn/Xtra/vo/bm_hecu/panic_2.ogg",false)
	Schema.voices.Add("HECU","Look out","Look out!","CourragatedDawn/Xtra/vo/bm_hecu/panic_3.ogg",false)
	Schema.voices.Add("HECU","What the hell","What the hell!?","CourragatedDawn/Xtra/vo/bm_hecu/panic_4.ogg",false)
-- Reloading --
	Schema.voices.Add("HECU","Reloading","Reloading!","CourragatedDawn/Xtra/vo/bm_hecu/reloading1.ogg",false)
	Schema.voices.Add("HECU","Reloading2","New magazine!","CourragatedDawn/Xtra/vo/bm_hecu/reloading2.ogg",false)
	Schema.voices.Add("HECU","Reloading3","I'm loading!","CourragatedDawn/Xtra/vo/bm_hecu/reloading3.ogg",false)
	Schema.voices.Add("HECU","Reloading4","Hey new mag in, cover me!","CourragatedDawn/Xtra/vo/bm_hecu/reloading4.ogg",false)
	Schema.voices.Add("HECU","Reloading5","Watch my back, I'm loading!","CourragatedDawn/Xtra/vo/bm_hecu/reloading5.ogg",false)
	Schema.voices.Add("HECU","Reloading6","I'm changing mags!","CourragatedDawn/Xtra/vo/bm_hecu/reloading6.ogg",false)
	Schema.voices.Add("HECU","Reloading7","Reloading!","CourragatedDawn/Xtra/vo/bm_hecu/reloading7.ogg",false)
	Schema.voices.Add("HECU","Fuck","Fuck fuck fuck!","CourragatedDawn/Xtra/vo/bm_hecu/reloading8.ogg",false)
-- Request Medical --
	Schema.voices.Add("HECU","Im hit","I'm hit!","CourragatedDawn/Xtra/vo/bm_hecu/requestmedical_1.ogg",false)
	Schema.voices.Add("HECU","I'm hit","I'm hit!","CourragatedDawn/Xtra/vo/bm_hecu/requestmedical_1.ogg",false)
	Schema.voices.Add("HECU","Pain9","Argh Goddamnit!","CourragatedDawn/Xtra/vo/bm_hecu/requestmedical_2.ogg",false)
	Schema.voices.Add("HECU","Pain10","Argh, Agh Goddamnit!","CourragatedDawn/Xtra/vo/bm_hecu/requestmedical_3.ogg",false)
-- Member lost --
	Schema.voices.Add("HECU","Corpsman3","CORPSMAN!!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_1.ogg",false)
	Schema.voices.Add("HECU","Corpsman2","Shit! Corpsman!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_2.ogg",false)
	Schema.voices.Add("HECU","Corpsman","Corpsman!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_3.ogg",false)
	Schema.voices.Add("HECU","Oh shit2","Oh, SHIT!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_4.ogg",false)
	Schema.voices.Add("HECU","Oh jesus","Oh, Jesus!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_5.ogg",false)
	Schema.voices.Add("HECU","Hes hit","Hes hit!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_6.ogg",false)
	Schema.voices.Add("HECU","Jesus","Jesus!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_7.ogg",false)
	Schema.voices.Add("HECU","Oh shit","Oh shit!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_8.ogg",false)
	Schema.voices.Add("HECU","Run","Run, RUN!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_9.ogg",false)
	Schema.voices.Add("HECU","Heads up2","Heads up!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_10.ogg",false)
	Schema.voices.Add("HECU","Go get em","Go get 'em!","CourragatedDawn/Xtra/vo/bm_hecu/squadmemlost_11.ogg",false)
-- End --

Schema.voices.AddClass("HECU", function(client)
    return client:Team() == FACTION_CONSCRIPT
end)

-- Security Guards --
	-- Behind you --
	Schema.voices.Add("SecurityGuard","Heads up3","Heads up!","CourragatedDawn/Xtra/vo/bm_guard/behindyou01.ogg",false)
	Schema.voices.Add("SecurityGuard","Watch ass","Watch yer ass!","CourragatedDawn/Xtra/vo/bm_guard/behindyou04.ogg",false)
	-- Bullsquid spot --
	Schema.voices.Add("SecurityGuard","Franken Squid","Franken squid!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid01.ogg",false)
	Schema.voices.Add("SecurityGuard","Franken Squids","Hey its one of those Franken squids!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid02.ogg",false)
	Schema.voices.Add("SecurityGuard","Dinosaur","Oh shit its a Dinosaur!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid03.ogg",false)
	Schema.voices.Add("SecurityGuard","Octopus","Shit Octopus!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid04.ogg",false)
	Schema.voices.Add("SecurityGuard","Spit chicken","God damn Spit Chicken!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid05.ogg",false)
	Schema.voices.Add("SecurityGuard","Squid Chicken","Watch out for that Squid Chicken!","CourragatedDawn/Xtra/vo/bm_guard/bullsquid06.ogg",false)
	-- reload --
	Schema.voices.Add("SecurityGuard","reload","Cover me while I reload!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload01.ogg",false)
	Schema.voices.Add("SecurityGuard","reload2","Hold them off while I reload!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload02.ogg",false)
	Schema.voices.Add("SecurityGuard","reload3","I'm empty, cover me!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload03.ogg",false)
	Schema.voices.Add("SecurityGuard","How many shots","Shit how many shots was that?!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload04.ogg",false)
	Schema.voices.Add("SecurityGuard","reloading8","Reloading!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload05.ogg",false)
	Schema.voices.Add("SecurityGuard","Reload4","Ah crap, I'm empty!","CourragatedDawn/Xtra/vo/bm_guard/coverwhilereload06.ogg",false)
	-- even the odds / pickup --
	Schema.voices.Add("SecurityGuard","Even the odds","Lets even the odds a little.","CourragatedDawn/Xtra/vo/bm_guard/eventheodds01.ogg",false)
	Schema.voices.Add("SecurityGuard","aw sweet","Awe, sweet.","CourragatedDawn/Xtra/vo/bm_guard/eventheodds04.ogg",false)
	Schema.voices.Add("SecurityGuard","aw baby","Awe, baby.","CourragatedDawn/Xtra/vo/bm_guard/eventheodds07.ogg",false)
	Schema.voices.Add("SecurityGuard","fantastic2","Frickin fantastic.","CourragatedDawn/Xtra/vo/bm_guard/fantastic01.ogg",false)
	Schema.voices.Add("SecurityGuard","fantastic3","Frickin fantastic.","CourragatedDawn/Xtra/vo/bm_guard/fantastic02.ogg",false)
	Schema.voices.Add("SecurityGuard","fantastic4","Fan frickin 'tastic.","CourragatedDawn/Xtra/vo/bm_guard/fantastic03.ogg",false)
	Schema.voices.Add("SecurityGuard","fantastic5","Fan frickin fan-tastic.","CourragatedDawn/Xtra/vo/bm_guard/fantastic04.ogg",false)
	Schema.voices.Add("SecurityGuard","fantastic","Fan-tastic.","CourragatedDawn/Xtra/vo/bm_guard/fantastic05.ogg",false)
	-- finally --
	Schema.voices.Add("SecurityGuard","finally","Finally.","CourragatedDawn/Xtra/vo/bm_guard/finally01.ogg",false)
	Schema.voices.Add("SecurityGuard","about time","It's about damn time.","CourragatedDawn/Xtra/vo/bm_guard/finally02.ogg",false)
	Schema.voices.Add("SecurityGuard","finally2","Aw frickin finally.","CourragatedDawn/Xtra/vo/bm_guard/finally03.ogg",false)
	-- Get down --
	Schema.voices.Add("SecurityGuard","Get down2","Get down!","CourragatedDawn/Xtra/vo/bm_guard/getdown01.ogg",false)
	Schema.voices.Add("SecurityGuard","Down","Down!","CourragatedDawn/Xtra/vo/bm_guard/getdown02.ogg",false)
	-- get out --
	Schema.voices.Add("SecurityGuard","Get out","Get the hell out!","CourragatedDawn/Xtra/vo/bm_guard/gethellout01.ogg",false)
	Schema.voices.Add("SecurityGuard","Lets Get out","Lets get the hell outta here!","CourragatedDawn/Xtra/vo/bm_guard/gethellout02.ogg",false)
	Schema.voices.Add("SecurityGuard","We gotta go","We gotta go, now!","CourragatedDawn/Xtra/vo/bm_guard/gethellout04.ogg",false)
	Schema.voices.Add("SecurityGuard","Get out2","Get the hell outta here!","CourragatedDawn/Xtra/vo/bm_guard/gethellout05.ogg",false)
	-- good god --
	Schema.voices.Add("SecurityGuard","God sake","God sake.","CourragatedDawn/Xtra/vo/bm_guard/goodgod02.ogg",false)
	Schema.voices.Add("SecurityGuard","Christ sake","Awh, christ sake.","CourragatedDawn/Xtra/vo/bm_guard/goodgod03.ogg",false)
	Schema.voices.Add("SecurityGuard","God damn","God damn.","CourragatedDawn/Xtra/vo/bm_guard/goodgod04.ogg",false)
	Schema.voices.Add("SecurityGuard","Hell no","Awh hell no.","CourragatedDawn/Xtra/vo/bm_guard/goodgod05.ogg",false)
	Schema.voices.Add("SecurityGuard","Good god","Good god.","CourragatedDawn/Xtra/vo/bm_guard/goodgod07.ogg",false)
	-- gordead_ques --
	Schema.voices.Add("SecurityGuard","got a chance","You still think we got a chance in all this?","CourragatedDawn/Xtra/vo/bm_guard/gordead_ques01.ogg",false)
	-- got one --
	Schema.voices.Add("SecurityGuard","See that shot","Man did you see that shot?","CourragatedDawn/Xtra/vo/bm_guard/gotone01.ogg",false)
	Schema.voices.Add("SecurityGuard","Hey I got one","Hey I got one!","CourragatedDawn/Xtra/vo/bm_guard/gotone02.ogg",false)
	Schema.voices.Add("SecurityGuard","Bring it on","Bring it on!","CourragatedDawn/Xtra/vo/bm_guard/gotone03.ogg",false)
	Schema.voices.Add("SecurityGuard","Got another one","Aha, Got another one!","CourragatedDawn/Xtra/vo/bm_guard/gotone04.ogg",false)
	Schema.voices.Add("SecurityGuard","One less horror","Thats one less horror in the world.","CourragatedDawn/Xtra/vo/bm_guard/gotone05.ogg",false)
	Schema.voices.Add("SecurityGuard","That was close","Phew, That was close.","CourragatedDawn/Xtra/vo/bm_guard/gotone06.ogg",false)
	Schema.voices.Add("SecurityGuard","Trophy room","That would look nice in my trophy room.","CourragatedDawn/Xtra/vo/bm_guard/gotone07.ogg",false)
	Schema.voices.Add("SecurityGuard","Bullseye","Ha, bullseye!","CourragatedDawn/Xtra/vo/bm_guard/gotone08.ogg",false)
	Schema.voices.Add("SecurityGuard","Suck it","Suck it.","CourragatedDawn/Xtra/vo/bm_guard/gotone09.ogg",false)
	Schema.voices.Add("SecurityGuard","Frickin freak","How did that taste? You frickin freak.","CourragatedDawn/Xtra/vo/bm_guard/gotone10.ogg",false)
	-- Gotta reload --
	Schema.voices.Add("SecurityGuard","Gotta reload","Gotta reload!","CourragatedDawn/Xtra/vo/bm_guard/gottareload01.ogg",false)
	Schema.voices.Add("SecurityGuard","Gotta reload2","Cover me, gotta reload!","CourragatedDawn/Xtra/vo/bm_guard/gottareload04.ogg",false)
	-- Death -- later, tired.
	-- Schema.voices.Add("SecurityGuard","Gotta reload2","Cover me, gotta reload!","CourragatedDawn/Xtra/vo/bm_guard/gottareload04.ogg",false)
	-- Nice shot --
	Schema.voices.Add("SecurityGuard","have it","Yeah, let 'em have it!","CourragatedDawn/Xtra/vo/bm_guard/grd_niceshot05.ogg",false)
	-- Headcrab --
	Schema.voices.Add("SecurityGuard","Yuck","Yuck..","CourragatedDawn/Xtra/vo/bm_guard/headcrab06.ogg",false)
	Schema.voices.Add("SecurityGuard","Everywhere","Man these things are everywhere.","CourragatedDawn/Xtra/vo/bm_guard/headcrab09.ogg",false)
	Schema.voices.Add("SecurityGuard","Creepy","Okay these things are creepy.","CourragatedDawn/Xtra/vo/bm_guard/headcrab11.ogg",false)
	Schema.voices.Add("SecurityGuard","Popping all over","These things are poppin' up all over the place.","CourragatedDawn/Xtra/vo/bm_guard/headcrab12.ogg",false)
	-- help --
	Schema.voices.Add("SecurityGuard","Help2","Help me!","CourragatedDawn/Xtra/vo/bm_guard/help02.ogg",false)
	Schema.voices.Add("SecurityGuard","Help3","I could use some help!","CourragatedDawn/Xtra/vo/bm_guard/help03.ogg",false)
	Schema.voices.Add("SecurityGuard","Help4","I need some help over here!","CourragatedDawn/Xtra/vo/bm_guard/help04.ogg",false)
	-- taking fire --
	Schema.voices.Add("SecurityGuard","Taking fire","Ergh, taking fire!","CourragatedDawn/Xtra/vo/bm_guard/hitingut03.ogg",false)
	-- Incoming -- 
	Schema.voices.Add("SecurityGuard","Incoming","Incoming!","CourragatedDawn/Xtra/vo/bm_guard/incoming01.ogg",false)
	Schema.voices.Add("SecurityGuard","Heads up4","Heads up!","CourragatedDawn/Xtra/vo/bm_guard/incoming02.ogg",false)
	-- Like that --
	Schema.voices.Add("SecurityGuard","Want more","You want some more?!","CourragatedDawn/Xtra/vo/bm_guard/likethat03.ogg",false)
	Schema.voices.Add("SecurityGuard","You asked for it","You asked for it!","CourragatedDawn/Xtra/vo/bm_guard/likethat04.ogg",false)
	Schema.voices.Add("SecurityGuard","Feeling lucky","You feeling lucky?!","CourragatedDawn/Xtra/vo/bm_guard/likethat05.ogg",false)
	Schema.voices.Add("SecurityGuard","you like that","A-Haha. How do you like that!?","CourragatedDawn/Xtra/vo/bm_guard/likethat06.ogg",false)
	-- marine taunt --
	Schema.voices.Add("SecurityGuard","Waiting for","Come on, what are you waiting for?","CourragatedDawn/Xtra/vo/bm_guard/marine_dead10.ogg",false)
	Schema.voices.Add("SecurityGuard","Semper fi","Semper fi you douchebag!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt03.ogg",false)
	Schema.voices.Add("SecurityGuard","Chicken shit bastards","Come out and fight, you chicken shit bastards!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt04.ogg",false)
	Schema.voices.Add("SecurityGuard","Shoot like a girl","You shoot like a girl!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt05.ogg",false)
	Schema.voices.Add("SecurityGuard","Targets move","Yeah, targets move! Jackass.","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt06.ogg",false)
	Schema.voices.Add("SecurityGuard","Kitchen duty","Might want to stick to kitchen duty, soldier!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt08.ogg",false)
	Schema.voices.Add("SecurityGuard","Target for ya","Hey, here's a target for ya!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt10.ogg",false)
	Schema.voices.Add("SecurityGuard","Target right here","I got your target right here!","CourragatedDawn/Xtra/vo/bm_guard/marine_taunt11.ogg",false)
	-- hurt --
	Schema.voices.Add("SecurityGuard","My arm","Gah, my arm!","CourragatedDawn/Xtra/vo/bm_guard/myarm01.ogg",false)
	Schema.voices.Add("SecurityGuard","My arm2","Argh, my arm!","CourragatedDawn/Xtra/vo/bm_guard/myarm02.ogg",false)
	Schema.voices.Add("SecurityGuard","My arm3","Ough, my arm!","CourragatedDawn/Xtra/vo/bm_guard/myarm03.ogg",false)
	Schema.voices.Add("SecurityGuard","My Gut","Augh, my Gut!","CourragatedDawn/Xtra/vo/bm_guard/mygut01.ogg",false)
	Schema.voices.Add("SecurityGuard","My Gut2","Aurgh, my Gut!","CourragatedDawn/Xtra/vo/bm_guard/mygut02.ogg",false)
	Schema.voices.Add("SecurityGuard","My Gut3","Oughh, my Gut!","CourragatedDawn/Xtra/vo/bm_guard/mygut03.ogg",false)
	Schema.voices.Add("SecurityGuard","My Gut4","Oughh, my Gut!","CourragatedDawn/Xtra/vo/bm_guard/mygut03.ogg",false)
	Schema.voices.Add("SecurityGuard","Pain11","Arggh!","CourragatedDawn/Xtra/vo/bm_guard/pain04.ogg",false)
	Schema.voices.Add("SecurityGuard","Pain12","Aughh!","CourragatedDawn/Xtra/vo/bm_guard/pain05.ogg",false)
	Schema.voices.Add("SecurityGuard","Pain13","Auwgh!","CourragatedDawn/Xtra/vo/bm_guard/pain06.ogg",false)
	-- Misc --
	Schema.voices.Add("SecurityGuard","Oh no","Oh no!","CourragatedDawn/Xtra/vo/bm_guard/ohno03.ogg",false)
	Schema.voices.Add("SecurityGuard","Run for life","Run for your life!","CourragatedDawn/Xtra/vo/bm_guard/runforyourlife01.ogg",false)
	Schema.voices.Add("SecurityGuard","Holy shit2","Hole-lee SHIT!","CourragatedDawn/Xtra/vo/bm_guard/runforyourlife04.ogg",false)
	Schema.voices.Add("SecurityGuard","Get outta here","Get the hell outta here!","CourragatedDawn/Xtra/vo/bm_guard/runforyourlife05.ogg",false)
	Schema.voices.Add("SecurityGuard","Startle1","Hough!","CourragatedDawn/Xtra/vo/bm_guard/startle01.ogg",false)
	Schema.voices.Add("SecurityGuard","Startle2","Holy hell!","CourragatedDawn/Xtra/vo/bm_guard/startle02.ogg",false)
	Schema.voices.Add("SecurityGuard","Startle3","OH!, shii...","CourragatedDawn/Xtra/vo/bm_guard/startle03.ogg",false)
	-- Zombies
	Schema.voices.Add("SecurityGuard","Zombies","These things are like, zombies or something.","CourragatedDawn/Xtra/vo/bm_guard/zombies_dead02.ogg",false)
	Schema.voices.Add("SecurityGuard","Head thing","Aim for the head, thing!","CourragatedDawn/Xtra/vo/bm_guard/zombies_headthing01.ogg",false)
	-- OPEN FIRE --
	Schema.voices.Add("SecurityGuard","Open fire","Open fire!","CourragatedDawn/Xtra/vo/bm_guard/zombies_openfire02.ogg",false)
-- end --
	
Schema.voices.AddClass("SecurityGuard", function(client)
    return client:Team() == FACTION_CONSCRIPT
end)