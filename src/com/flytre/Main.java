package com.flytre;

import com.flytre.CustomItems.CustomAbility;
import com.flytre.CustomItems.CustomGun;
import com.flytre.CustomItems.ShopItem;
import com.flytre.Particles.*;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws InvalidItemException, IOException {


        Implementer.initialize();


        FunctionWriter.addObj("health");
        FunctionWriter.addObj("rng");
        FunctionWriter.addObj("trigger", "trigger");
        FunctionWriter.addStatment("init_items", "team add green");
        FunctionWriter.addStatment("init_items", "team add blue");
        FunctionWriter.addStatment("init_items", "team modify green color green");
        FunctionWriter.addStatment("init_items", "team modify blue color blue");
        FunctionWriter.addStatment("init_items", "team modify green friendlyFire false");
        FunctionWriter.addStatment("init_items", "team modify blue friendlyFire false");

        FunctionWriter.makeFunction("shop_base");
        FunctionWriter.addStatment("shop_base", "scoreboard players enable @a trigger");
        FunctionWriter.makeFunction("testing");
        FunctionWriter.addStatment("generic_base", "function flytre:shop_base");


        Implementer.initializeGun();
        Implementer.initializeAbility();


        //shop items. Guns are  built in, ability shop items are added here
        ShopItem saber_1 = new ShopItem("saber_1", "carrot_on_a_stick", "§rSaber", new String[]{"§7Damage: §c700", "§7Speed: §c1.77", "§7Armor Pierce: §c100%", "§7Health Regen: §c+20 §7hp/sec"}, 25, "HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:\"generic.attackDamage\",Name:\"generic.attackDamage\",Amount:13,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:\"mainhand\"},{AttributeName:\"generic.attackSpeed\",Name:\"generic.attackSpeed\",Amount:-2.25,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:\"mainhand\"}],type:\"saber\"");
        saber_1.setNbtGreen("CustomModelData:7");
        saber_1.setNbtBlue("CustomModelData:8");

        ShopItem saber_2 = new ShopItem("saber_2", "carrot_on_a_stick", "§rSaber", new String[]{"§7Damage: §c1000", "§7Speed: §c1.77", "§7Armor Pierce: §c100%", "§7Health Regen: §c+20 §7hp/sec"}, 55, "HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:\"generic.attackDamage\",Name:\"generic.attackDamage\",Amount:20,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:\"mainhand\"},{AttributeName:\"generic.attackSpeed\",Name:\"generic.attackSpeed\",Amount:-2.25,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:\"mainhand\"}],type:\"saber\"");
        saber_2.setNbtGreen("CustomModelData:7");
        saber_2.setNbtBlue("CustomModelData:8");

        Implementer.addShopItem(saber_1);
        Implementer.addShopItem(saber_2);
        ShopItem toughened_vest = new ShopItem("toughened_vest", "leather_chestplate", "§rToughened Vest", new String[]{"§7Armor: §c20%"}, 10, "armor:20,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        toughened_vest.setColorBlue(262348);
        toughened_vest.setColorGreen(4325135);
        Implementer.addShopItem(toughened_vest);

        ShopItem combat_vest = new ShopItem("combat_vest", "leather_chestplate", "§rCombat Vest", new String[]{"§7Armor: §c40%"}, 30, "armor:40,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_vest.setColorBlue(262348);
        combat_vest.setColorGreen(4325135);
        Implementer.addShopItem(combat_vest);

        ShopItem toughened_legs = new ShopItem("toughened_legs", "leather_leggings", "§rToughened Pants", new String[]{"§7Armor: §c15%"}, 10, "armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        toughened_legs.setColorBlue(262348);
        toughened_legs.setColorGreen(4325135);
        Implementer.addShopItem(toughened_legs);

        ShopItem combat_legs = new ShopItem("combat_legs", "leather_leggings", "§rCombat Pants", new String[]{"§7Armor: §c30%"}, 25, "armor:30,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_legs.setColorBlue(262348);
        combat_legs.setColorGreen(4325135);
        Implementer.addShopItem(combat_legs);

        ShopItem trooper_boots = new ShopItem("trooper_boots", "leather_boots", "§rTrooper Boots", new String[]{"§7Armor: §c15%"}, 10, "armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        trooper_boots.setColorBlue(262348);
        trooper_boots.setColorGreen(4325135);
        Implementer.addShopItem(trooper_boots);

        ShopItem combat_boots = new ShopItem("combat_boots", "leather_boots", "§rCombat Boots", new String[]{"§7Armor: §c25%"}, 20, "armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_boots.setColorBlue(262348);
        combat_boots.setColorGreen(4325135);
        Implementer.addShopItem(combat_boots);

        ShopItem dasher = new ShopItem("dash", "carrot_on_a_stick", "§eDash", new String[]{"§7Gain Speed §62§7 for §65§7 seconds.", "§7The same ability does §cNOT§7 stack."}, 15, "ability:\"dash\",CustomModelData:9");
        Implementer.addShopItem(dasher);

        ShopItem blinker = new ShopItem("blink", "carrot_on_a_stick", "§eBlink", new String[]{"§7Teleport up to §68§7 blocks forward.", "§7Aim slightly upwards for better results.", "§7The same ability does §cNOT§7 stack."}, 20, "ability:\"blink\",CustomModelData:10");
        Implementer.addShopItem(blinker);

        ShopItem weakheal = new ShopItem("weak_heal", "carrot_on_a_stick", "§eWeak Heal", new String[]{"§7Heal §63.0§7 hearts.", "§7The same ability does §cNOT§7 stack."}, 15, "ability:\"weak_heal\",CustomModelData:11");
        Implementer.addShopItem(weakheal);

        ShopItem strongheal = new ShopItem("strong_heal", "carrot_on_a_stick", "§eStrong Heal", new String[]{"§7Heal §66.0§7 hearts.", "§7The same ability does §cNOT§7 stack."}, 25, "ability:\"strong_heal\",CustomModelData:11");
        Implementer.addShopItem(strongheal);


        ShopItem concussion = new ShopItem("team_heal", "carrot_on_a_stick", "§eTeam Heal", new String[]{"§7Heal your team for §61.5§7 hearts.", "§7The same ability does §cNOT§7 stack for the same person."}, 25, "ability:\"team_heal\",CustomModelData:16");
        Implementer.addShopItem(concussion);

        ShopItem spectraleye = new ShopItem("spectral_eye", "carrot_on_a_stick", "§eSpectral Eye", new String[]{"§7Reveal players within §612§7 blocks.", "§7The same ability does §cNOT§7 stack."}, 20, "ability:\"spectral_eye\",CustomModelData:15");
        Implementer.addShopItem(spectraleye);


        //guns
        CustomGun soft_sniper = new CustomGun("soft_sniper", 14, 70, 0.4, 0.0, 2, 50, "flytre.sniper.fire", "§6SpaceTech §rSeeker", 55, "sniper", 5, 12.0);
        Implementer.addGun(soft_sniper);

        CustomGun hard_sniper = new CustomGun("hard_sniper", 22, 90, 0.14, 0.0, 0, 50, "flytre.sniper.fire", "§6FlyteForce §rNightmare", 100, "sniper", 1, 10.0);
        Implementer.addGun(hard_sniper);

        CustomGun pistol_1 = new CustomGun("pistol_1", 5, 30, 3, 0.02, 3, 30, "flytre.pistol.fire", "§6Nova §rLethalMark", 25, "pistol", 10, 2.1);
        Implementer.addGun(pistol_1);

        CustomGun pistol_2 = new CustomGun("pistol_2", 8, 40, 2, 0.06, 5, 20, "flytre.pistol.fire", "§6Nova §rBeamer", 30, "pistol", 20, 3.0);
        Implementer.addGun(pistol_2);

        CustomGun pistol_3 = new CustomGun("pistol_3", 4, 20, 4, 0.08, 8, 15, "flytre.pistol.fire", "§6Omega §rLaserSpeed", 30, "pistol", 20, 2.0);
        Implementer.addGun(pistol_3);

        CustomGun smg = new CustomGun("smg", 4, 40, 8, 0.07, 15, 12, "flytre.assault_rifle.fire", "§6FlyteForce §rRapidStrike", 70, "smg", 40, 2.5);
        Implementer.addGun(smg);

        CustomGun ar_1 = new CustomGun("ar_1", 5, 50, 6, 0.04, 12, 20, "flytre.assault_rifle.fire", "§6SpaceTech §rHunter", 70, "rifle", 25, 3.2);
        Implementer.addGun(ar_1);

        CustomGun ar_2 = new CustomGun("ar_2", 5, 60, 4, 0.01, 10, 25, "flytre.assault_rifle.fire", "§6Omega §rBlaster", 50, "rifle", 30, 2.1);
        Implementer.addGun(ar_2);

        CustomGun shotty = new CustomGun("shotty", 5, 50, 4, 0.09, 18, 8, "flytre.shotgun.fire", "§6Omega §rShowstopper", 65, "shotgun", 2, 2.2);
        Implementer.addGun(shotty);


        CustomGun ar_3 = new CustomGun("ar_3", 6, 50, 20, 0.01, 8, 30, "flytre.assault_rifle.fire", "§6Arcix §rTriforce", 85, "rifle", 3, 1.25);
        Implementer.addGun(ar_3);

        CustomGun goo = new CustomGun("goo", 2, 0, 2, 0.00, 4, 20, "flytre.slime.fire", "§6Arcix §rSlime Hunter", 50, "slime", 10, 5.4);
        Implementer.addGun(goo);

        CustomGun rocket = new CustomGun("rocket", 0, 100, 0.2, 0.00, 0, 20, "flytre.rocket.fire", "§6Arcix §rZardieren", 75, "rocket", 1, 1.0);
        Implementer.addGun(rocket);

        CustomGun shocker = new CustomGun("shocker", 7, 50, 0.8, 0.00, 8, 20, "flytre.shocker.fire", "§6Xilian §rVolt", 90, "shocker", 1, 1.25);
        Implementer.addGun(shocker);

        CustomGun minigun = new CustomGun("minigun", 2.1, 10, 20, 0.04, 30, 20, "flytre.assault_rifle.fire", "§6Xilian §rUltron", 85, "minigun", 100, 6.5);
        Implementer.addGun(minigun);

        CustomGun firecracker = new CustomGun("firecracker", 4, 40, 4, 0.03, 20, 20, "flytre.assault_rifle.fire", "§6Xilian §rRadeon", 75, "firecracker", 20, 2.1);
        Implementer.addGun(firecracker);


        //particles
        Implementer.addParticle(new ParticleTriangle("heal_1", "heart", 3));
        Implementer.addParticle(new ParticleCircle("heal_2", 2, "heart", 10));
        Implementer.addParticle(new ParticleTriPyramid("spectral_eye", "dripping_water", 2, 3));
        Implementer.addParticle(new ParticleHelix("helix", 2, "smoke", 3, 2));

        //abilities
        CustomAbility dash = new CustomAbility.Builder("dash").message("You have used Dash!").cooldown(300).displayName("§eDash").effect("effect give @s speed 6 1 true").overTimeDuration(100).overTimeEffect("particle minecraft:cloud ~ ~-.1 ~0 0 .05 0 0 8 force").sound("block.beacon.activate").build();

        CustomAbility blink = new CustomAbility.Builder("blink").message("You have Blinked!").cooldown(400).displayName("§eBlink").effect("function flytre:abilities/blink_effect").sound("entity.enderman.teleport").build();

        CustomAbility weak_heal = new CustomAbility.Builder("weak_heal").message("You have healed!").cooldown(350).displayName("§eWeak Heal").effect(new String[]{
                "execute rotated 0 45 run function flytre:particles/heal_2",
                "execute rotated 90 45 run function flytre:particles/heal_2",
                "execute rotated 180 45 run function flytre:particles/heal_2",
                "execute rotated 270 45 run function flytre:particles/heal_2",
                "scoreboard players set @s[scores={health=1400..}] health 2000", "scoreboard players add @s[scores={health=..1399}] health 600"}).sound("flytre.powerup.1").build();
        CustomAbility strong_heal = new CustomAbility.Builder("strong_heal").message("You have healed!").cooldown(400).displayName("§eStrong Heal").effect(new String[]{
                "execute rotated 0 45 run function flytre:particles/heal_2",
                "execute rotated 90 45 run function flytre:particles/heal_2",
                "execute rotated 180 45 run function flytre:particles/heal_2",
                "execute rotated 270 45 run function flytre:particles/heal_2",
                "scoreboard players set @s[scores={health=800..}] health 2000", "scoreboard players add @s[scores={health=..799}] health 1200"}).sound("flytre.powerup.1").build();

        CustomAbility team_heal = new CustomAbility.Builder("team_heal").message("You have healed your team!").cooldown(450).displayName("§eTeam Heal").effect(new String[]{
                "execute rotated 0 45 run function flytre:particles/heal_2",
                "execute rotated 90 45 run function flytre:particles/heal_2",
                "execute rotated 180 45 run function flytre:particles/heal_2",
                "execute rotated 270 45 run function flytre:particles/heal_2",
                "execute as @a[team=green] run scoreboard players set @s[team=green,scores={health=1600..}] health 2000", "execute as @s[team=green] run scoreboard players add @a[team=green,scores={health=..1599}] health 400", "execute as @a[team=blue] run scoreboard players set @s[team=blue,scores={health=1600..}] health 2000", "execute as @s[team=blue] run scoreboard players add @a[team=blue,scores={health=..1599}] health 400"}).sound("flytre.powerup.1").build();
        CustomAbility spectral = new CustomAbility.Builder("spectral_eye").message("Your Spectral Eye has activated, revealing nearby enemies!").cooldown(500).displayName("§eSpectral Eye").effect(new String[]{"execute rotated ~ 0 run function flytre:particles/spectral_eye", "execute as @s[team=blue] run effect give @a[team=green,distance=..18] glowing 5 0 true", "execute as @s[team=green] run effect give @a[team=blue,distance=..18] glowing 5 0 true"}).sound("flytre.powerup.2").build();


        Implementer.addAbility(weak_heal, weakheal);
        Implementer.addAbility(strong_heal, strongheal);
        Implementer.addAbility(dash, dasher);
        Implementer.addAbility(blink, blinker);
        Implementer.addAbility(team_heal, concussion);
        Implementer.addAbility(spectral, spectraleye);


        Implementer.postInitializeAbility();
        Implementer.postInitializeGun();

        FunctionWriter.addStatment("shop_base", "scoreboard players set @a trigger 0");
    }

}
