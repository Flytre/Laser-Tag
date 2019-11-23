package com.flytre;

import com.flytre.CustomItems.*;
import com.flytre.Particles.*;

import java.text.DecimalFormat;

class Implementer {


    private static int enderIDCounter = 2;
    private static int triggerCount = 217466;

    static void initialize() {
        FunctionWriter.deleteOld();
        FunctionWriter.createDatapack();
        FunctionWriter.makeFunction("init_items");
        FunctionWriter.makeFunction("info");
        FunctionWriter.makeFunction("generic_base");

        FunctionWriter.makeLoadJSON();
        FunctionWriter.makeTickJSON();


    }

    static void initializeBow() {
        FunctionWriter.makeFunction("bow_base");
        FunctionWriter.addStatment("generic_base", "function flytre:bow_base");

        FunctionWriter.addStatment("bow_arrow_init", "execute as @a run scoreboard players operation @s enderID2 = @s enderID");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s run scoreboard players operation @a enderID2 -= @s enderID");


        FunctionWriter.addObj("enderID");
        FunctionWriter.addObj("enderID2");
        FunctionWriter.addObj("arrowDetection");

        FunctionWriter.addStatment("bow_base", "execute as @a store result score @s enderID run data get entity @s UUIDLeast 0.00000000001");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow] at @s store result score @s enderID run data get entity @s OwnerUUIDLeast 0.00000000001");


    }

    static void initializeSword() {

        FunctionWriter.makeFunction("sword_base");
        FunctionWriter.addStatment("generic_base", "function flytre:sword_base");

        FunctionWriter.addObj("damageDealt", "minecraft.custom:minecraft.damage_dealt");
        FunctionWriter.addObj("killedEntity", "totalKillCount");


    }

    static void initializeAbility() {

        FunctionWriter.makeFunction("ability_base");
        FunctionWriter.addStatment("generic_base", "function flytre:ability_base");

        FunctionWriter.addObj("rightclick", "minecraft.used:minecraft.carrot_on_a_stick");
        FunctionWriter.addObj("custom_item");

    }

    static void initializeTrident() {
        FunctionWriter.makeFunction("trident_base");
        FunctionWriter.addStatment("generic_base", "function flytre:trident_base");
    }

    static void initializeShield() {
        FunctionWriter.makeFunction("shield_base");
        FunctionWriter.addStatment("generic_base", "function flytre:shield_base");
        FunctionWriter.addObj("shieldblock", "minecraft.custom:minecraft.damage_blocked_by_shield");
    }

    static void initializeArmor() {
        FunctionWriter.makeFunction("armor_base");
        FunctionWriter.addStatment("generic_base", "function flytre:armor_base");
    }


    /*
    hasPlayerSelector false: @s references the arrow
    hasPlayerSelector true: @s references the arrow, @a[tag=bow_<id>] references the shooter
    */
    static void addBow(CustomBow bow) {

        FunctionWriter.addStatment("bow_base", "execute as @a[nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}}] at @s run execute as @e[type=arrow,distance=..10,tag=!init,limit=1] at @s run function flytre:bow_arrow_init");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s if entity @a[scores={enderID2=0},nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}},distance=..10] run tag @s add custom_arrow");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s if entity @a[scores={enderID2=0},nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}},distance=..10] run tag @s add " + bow.getId());

        if (bow.getTrail() != null)
            FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s positioned ~ ~.5 ~ run particle " + bow.getTrail() + " ~ ~-" + bow.getTrailRad() + " ~0 0 " + (bow.getTrailRad() * 2) + " 0 0 30 force");


        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s run kill @e[type=armor_stand,distance=..8,tag=" + bow.getId() + ",limit=1]");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s run summon armor_stand ~ ~1 ~ {Tags:[" + bow.getId() + ",arrow_stand],NoGravity:1b,Small:1,Marker:1b,Invisible:1,Invulnerable:1,NoBasePlate:1,PersistenceRequired:1,DisabledSlots:2039583}");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + "] at @s store result score @e[type=armor_stand,tag=" + bow.getId() + ",limit=1,distance=..8] enderID run data get entity @s OwnerUUIDLeast 0.00000000001");

        if (!bow.hasPlayerSelector()) {
            if (bow.getEffect() != null)
                for (String s : bow.getEffect())
                    FunctionWriter.addStatment("bow_base", "execute as @e[type=armor_stand,tag=" + bow.getId() + ",scores={arrowDetection=3}] at @s run " + s);


        } else {

            FunctionWriter.addObj("enderID" + (++enderIDCounter));

            FunctionWriter.makeFunction("bows/" + bow.getId());

            FunctionWriter.addStatment("bow_base", "execute as @e[type=armor_stand,tag=" + bow.getId() + ",scores={arrowDetection=3}] at @s run function flytre:bows/" + bow.getId());


            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run execute as @a run scoreboard players operation @s enderID" + enderIDCounter + " = @s enderID");
            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run scoreboard players operation @a enderID" + enderIDCounter + " -= @s enderID");
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @a[scores={enderID" + enderIDCounter + "=0}] add bow_" + bow.getId());
            if (bow.getEffect() != null)
                for (String s : bow.getEffect()) {
                    FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run " + s);
                }
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @a remove bow_" + bow.getId());
            FunctionWriter.addStatment("bows/" + bow.getId(), "scoreboard players reset * enderID" + enderIDCounter);
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @s add effectDone");
            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @e[type=armor_stand,tag=" + bow.getId() + ",tag=!effectDone,scores={arrowDetection=3},sort=random,limit=1] at @s run function flytre:bows/" + bow.getId());

        }


        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s bow{ability:\\\"" + bow.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s bow{ability:\\\"" + bow.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + bow.getDisplayName() + " bow.\",\"color\":\"green\"}]");

    }


    /*
    Type: damage_as_victim: @s references the hurt entity
    Type: damage_as_attacker: @s references the attacker
    Type: kill_as_attacker: @s references the killer
     */
    static void addSword(CustomSword sword) {

        if (sword.getEffect() != null)
            for (String s : sword.getEffect()) {

                if (sword.getType().equals("damage_as_victim"))
                    FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run " + s);

                else if (sword.getType().equals("damage_as_attacker"))
                    FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run " + s);
                else if (sword.getType().equals("kill_as_attacker"))
                    FunctionWriter.addStatment("sword_base", "execute as @a[scores={killedEntity=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run " + s);

            }
        if (sword.getType().equals("damage_as_victim") || sword.getType().equals("damage_as_attacker"))
            FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run particle " + sword.getParticle() + " ~-0.1 ~0.65 ~-.1 0.2 0.75 0.2 0 35 force");
        if (sword.getType().equals("kill_as_attacker"))
            FunctionWriter.addStatment("sword_base", "execute as @a[scores={killedEntity=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run particle " + sword.getParticle() + " ~-0.1 ~0.65 ~-.1 0.2 0.75 0.2 0 20 force");


        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s diamond_sword{ability:\\\"" + sword.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s diamond_sword{ability:\\\"" + sword.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + sword.getDisplayName() + " sword.\",\"color\":\"green\"}]");


    }

    static void addAbility(CustomAbility ability, ShopItem si) {

        DecimalFormat df = new DecimalFormat("0.00000");

        FunctionWriter.makeFunction("abilities/" + ability.getId());
        FunctionWriter.addObj(ability.getId() + "_cd");

        FunctionWriter.addStatment("ability_base", "scoreboard players add @a[nbt={SelectedItem:{tag:{ability:\"" + ability.getId() + "\"}}}] " + ability.getId() + "_cd 0");
        FunctionWriter.addStatment("ability_base", "scoreboard players add @a[scores={" + ability.getId() + "_cd=..-1}] " + ability.getId() + "_cd 1");


        if (ability.getCooldown() >= 20) {
            AbilityTableGenerator atg = new AbilityTableGenerator(ability,si);
            FunctionWriter.addStatment("ability_base", "execute as @a[nbt={Inventory:[{tag:{ability:\""+ability.getId()+"\"}}]}] run function flytre:abilities/loot/" + ability.getId());
        }

        FunctionWriter.addStatment("ability_base", "execute as @a[scores={rightclick=1..," + ability.getId() + "_cd=0},nbt={SelectedItem:{tag:{ability:\"" + ability.getId() + "\"}}}] at @s run function flytre:abilities/" + ability.getId());


        FunctionWriter.addStatment("abilities/" + ability.getId(), "");


        if (ability.getSound() != null)
            FunctionWriter.addStatment("abilities/" + ability.getId(), "playsound " + ability.getSound() + " player @s");

        if (ability.getMessage() != null)
            FunctionWriter.addStatment("abilities/" + ability.getId(), "tellraw @s [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Ability\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\":\",\"color\":\"none\"},{\"text\":\" " + ability.getMessage() + "\",\"color\":\"none\"}]");


        if (ability.getEffect() != null)
            for (String s : ability.getEffect()) {
                FunctionWriter.addStatment("abilities/" + ability.getId(), s);
            }

        FunctionWriter.addStatment("abilities/" + ability.getId(), "scoreboard players set @s " + ability.getId() + "_cd " + (ability.getCooldown() * -1));

        if (ability.getOverTimeEffect() != null && ability.getOverTimeDuration() > 0)
            for (String s : ability.getOverTimeEffect()) {
                FunctionWriter.makeFunction("abilities/" + ability.getId() + "_time");
                FunctionWriter.addStatment("ability_base", "execute as @a[scores={" + ability.getId() + "_cd=" + (ability.getCooldown() * -1) + ".." + ((ability.getCooldown() - ability.getOverTimeDuration()) * -1) + "}] at @s run function flytre:abilities/" + ability.getId() + "_time");

                FunctionWriter.addStatment("abilities/" + ability.getId() + "_time", s);

            }


        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s carrot_on_a_stick{ability:\\\"" + ability.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s carrot_on_a_stick{ability:\\\"" + ability.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + ability.getDisplayName() + " ability.\",\"color\":\"green\"}]");

    }


    /*
    Type: hurt_entity: @s references the entity
    Type: trident: @s references the trident

    hasPlayerSelector false: @s references the trident/hurt_entity
    hasPlayerSelector true: @s references the trident, @a[tag=tri_<id>] references the thrower
     */
    static void addTrident(CustomTrident trident) {


        if (trident.hasPlayerSelector() && trident.getEffect() != null) {

            FunctionWriter.addObj("enderID" + (++enderIDCounter));

            FunctionWriter.makeFunction("tridents/" + trident.getId());

            if (trident.getType().equals("trident"))
                FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run function flytre:tridents/" + trident.getId());
            else if (trident.getType().equals("hurt_entity")) {
                FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run function flytre:tridents/" + trident.getId());
                if (trident.hasEffectAnyways())
                    FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run function flytre:tridents/" + trident.getId());

            }
            FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @s run execute as @a run scoreboard players operation @s enderID" + enderIDCounter + " = @s enderID");
            FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @s run scoreboard players operation @a enderID" + enderIDCounter + " -= @s enderID");
            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @a[scores={enderID" + enderIDCounter + "=0}] add tri_" + trident.getId());

            if (trident.getEffect() != null)
                for (String s : trident.getEffect())
                    FunctionWriter.addStatment("tridents/" + trident.getId(), s);

            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @a remove tri_" + trident.getId());
            FunctionWriter.addStatment("tridents/" + trident.getId(), "scoreboard players reset * enderID" + enderIDCounter);
            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1,sort=nearest] add effectApplied");

            if (trident.getType().equals("trident"))
                FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run function flytre:tridents/" + trident.getId());
            else if (trident.getType().equals("hurt_entity")) {
                FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run function flytre:tridents/" + trident.getId());
                if (trident.hasEffectAnyways())
                    FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run function flytre:tridents/" + trident.getId());

            }


        } else {


            if (trident.getEffect() != null) {
                if (trident.getType().equals("hurt_entity"))
                    for (String s : trident.getEffect()) {
                        FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run " + s);
                        if (trident.hasEffectAnyways())
                            FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run " + s);
                    }
                else if (trident.getType().equals("trident"))
                    for (String s : trident.getEffect())
                        FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s run " + s);
            }

        }
        FunctionWriter.addStatment("trident_base", "tag @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] add effectApplied");
        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s trident{ability:\\\"" + trident.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s trident{ability:\\\"" + trident.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + trident.getDisplayName() + " trident.\",\"color\":\"green\"}]");

    }

    static void addShield(CustomShield shield) {

        if (shield.getEffect() != null)
            for (String s : shield.getEffect())
                FunctionWriter.addStatment("shield_base", "execute as @a[scores={shieldblock=1..},nbt={SelectedItem:{tag:{ability:\"" + shield.getId() + "\"}}}] at @s run " + s);


        if (shield.getPassiveEffect() != null)
            for (String s : shield.getPassiveEffect()) {
                FunctionWriter.addStatment("shield_base", "execute as @a[nbt={SelectedItem:{tag:{ability:\"" + shield.getId() + "\"}}}] at @s run " + s);
                FunctionWriter.addStatment("shield_base", "execute as @a[nbt={Inventory:[{Slot: -106b, tag:{ability:\"" + shield.getId() + "\"}}]}] at @s run " + s);
            }

        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s shield{ability:\\\"" + shield.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s shield{ability:\\\"" + shield.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + shield.getDisplayName() + " shield.\",\"color\":\"green\"}]");


    }

    static void addArmor(CustomArmor armor) {
        FunctionWriter.makeFunction("armor/" + armor.getId());

        if (armor.getEffect() != null) {
            for (String s : armor.getEffect())
                FunctionWriter.addStatment("armor/" + armor.getId(), s);
            if (armor.getParts().indexOf('h') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:103b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('c') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:102b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('l') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:101b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('b') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:103b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());

        }


        String piece = armor.getParts().indexOf('h') != -1 ? "helmet" : armor.getParts().indexOf('c') != -1 ? "chestplate" : armor.getParts().indexOf('c') != -1 ? "leggings" : "boots";

        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s diamond_" + piece + "{ability:\\\"" + armor.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s diamond_" + piece + "{ability:\\\"" + armor.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + armor.getDisplayName() + " " + piece + ".\",\"color\":\"green\"}]");

    }

    static void addParticle(ParticleShape p) {
        p.write();
    }

    static void postInitializeBow() {

        FunctionWriter.addStatment("bow_arrow_init", "execute as @e[type=arrow,tag=!custom_arrow,tag=!init,limit=1] at @s run function flytre:bow_arrow_init");


        FunctionWriter.addStatment("bow_base", "tag @e[type=arrow] add init");
        FunctionWriter.addStatment("bow_base", "scoreboard players add @e[type=armor_stand,tag=arrow_stand] arrowDetection 1");
        FunctionWriter.addStatment("bow_base", "kill @e[type=arrow,tag=custom_arrow,nbt={inGround:1b}]");
        FunctionWriter.addStatment("bow_base", "kill @e[type=armor_stand,tag=arrow_stand,scores={arrowDetection=4..}]");


    }

    static void postInitializeSword() {
        FunctionWriter.addStatment("sword_base", "scoreboard players set @a[scores={damageDealt=1..}] damageDealt 0");
        FunctionWriter.addStatment("sword_base", "scoreboard players set @a[scores={killedEntity=1..}] killedEntity 0");


    }

    static void postInitializeAbility() {

        FunctionWriter.addStatment("ability_base", "scoreboard players set @a[scores={rightclick=1..}] rightclick 0");
        FunctionWriter.addStatment("ability_base", "scoreboard players set @a custom_item 0");
    }

    static void postInitializeTrident() {
        FunctionWriter.addStatment("shield_base", "scoreboard players set @a[scores={shieldblock=1..}] shieldblock 0");
    }

    static void postInitializeShield() {
    }

    static void postInitializeArmor() {
    }

    static void initializeGun() {
        FunctionWriter.addObj("range");
        FunctionWriter.addObj("damage");
        FunctionWriter.addObj("damage2");
        FunctionWriter.addObj("armorPen");
        FunctionWriter.addObj("dropoff");
        FunctionWriter.addObj("armor");
        FunctionWriter.addObj("armor2");
        FunctionWriter.addObj("spray");
        FunctionWriter.addObj("travel_time");
        FunctionWriter.addObj("kills");
        FunctionWriter.addObj("kills2");
        FunctionWriter.addObj("gunSneak", "minecraft.custom:minecraft.sneak_time");
        FunctionWriter.addStatment("init_items", "scoreboard players set 100 dropoff 100");
        FunctionWriter.addStatment("init_items", "scoreboard players set 10000 dropoff 10000");
        FunctionWriter.addStatment("init_items", "team add green");
        FunctionWriter.addStatment("init_items", "team add blue");


    }


    private static void addShopItem(ShopItem si) {


        FunctionWriter.makeFunction("shop/" + si.getId());
        FunctionWriter.addStatment("shop/" + si.getId(), "tellraw @s[scores={credits=" + si.getCost() + "..}] [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Shop\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\": You have bought a\",\"color\":\"none\"},{\"text\":\" " + si.getName() + "\",\"color\":\"gold\"},{\"text\":\".\",\"color\":\"none\"}]");
        FunctionWriter.addStatment("shop/" + si.getId(), "tellraw @s[scores={credits=.." + (si.getCost() - 1) + "}] [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Shop\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\": You cannot afford a\",\"color\":\"none\"},{\"text\":\" " + si.getName() + "\",\"color\":\"gold\"},{\"text\":\".\",\"color\":\"none\"}]");
        String[] lore = si.getLore();
        for (int i = 0; i < lore.length; i++)
            lore[i] = "\"\\\"" + lore[i] + "\\\"\"";


        if (si.getItemID().matches("[a-z_]+_helmet")) {
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=green] armor.head " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}");
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=blue] armor.head " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}");

        } else if (si.getItemID().matches("[a-z_]+_chestplate")) {
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=green] armor.chest " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}");
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=blue] armor.chest " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}");

        } else if (si.getItemID().matches("[a-z_]+_leggings")) {
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=green] armor.legs " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}");
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=blue] armor.legs " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}");

        } else if (si.getItemID().matches("[a-z_]+_boots")) {
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=green] armor.feet " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}");
            FunctionWriter.addStatment("shop/" + si.getId(), "replaceitem entity @s[scores={credits=" + si.getCost() + "..},team=blue] armor.feet " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}");

        } else {
            FunctionWriter.addStatment("shop/" + si.getId(), "give @s[scores={credits=" + si.getCost() + "..},team=green] " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}");
            FunctionWriter.addStatment("shop/" + si.getId(), "give @s[scores={credits=" + si.getCost() + "..},team=blue] " + si.getItemID() + "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}");
        }
        FunctionWriter.addStatment("shop/" + si.getId(), "scoreboard players remove @s[scores={credits=" + si.getCost() + "..}] credits " + si.getCost());
        FunctionWriter.addStatment("shop/" + si.getId(), "playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25");


        FunctionWriter.addStatment("testing", "give @p oak_sign{BlockEntityTag:{Text1:\"{\\\"text\\\":\\\"[Buy]\\\",\\\"color\\\":\\\"green\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"run_command\\\",\\\"value\\\":\\\"trigger trigger set " + triggerCount + "\\\"}}\",Text2:\"[\\\"\\\",{\\\"text\\\":\\\"" + si.getName() + "\\\",\\\"color\\\":\\\"dark_red\\\"}]\",Text3:\"[\\\"\\\",{\\\"text\\\":\\\"Cost: \\\",\\\"color\\\":\\\"black\\\"},{\\\"text\\\":\\\"" + si.getCost() + "\\\",\\\"color\\\":\\\"dark_aqua\\\"}]\"},display:{Name:\"{\\\"text\\\":\\\"" + si.getName() + "\\\"}\"}}");


        FunctionWriter.addStatment("shop_base", "execute as @a[scores={trigger=" + triggerCount + "}] run function flytre:shop/" + si.getId());
        triggerCount++;


    }

    static void addGun(CustomGun g) throws InvalidItemException {
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " armorPen " + (int) (g.getArmor_pen()));
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " dropoff " + (int) ((1 - (g.getDropoff() / 4)) * 10000));
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " spray " + (int) g.getSpray());


        if (g.getType().equals("shotgun")) {
            FunctionWriter.makeFunction("guns/initiate_" + g.getId());
            for (int i = 0; i < 5; i++)
                FunctionWriter.addStatment("guns/initiate_" + g.getId(), "function flytre:guns/fire_" + g.getId());
        }


        FunctionWriter.makeFunction("guns/fire_" + g.getId());
        FunctionWriter.addStatment("guns/fire_" + g.getId(), "playsound " + g.getSound() + " player @a[distance=..10] ~ ~ ~ 0.3");

        FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s range 0");
        FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s damage " + (int) (100 * g.getDamage()));
        if (g.getSpray() >= 1) {
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "function flytre:rand_num");
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players operation @s rng = num rng");
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players operation @s rng %= " + g.getId() + " spray");

            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=.." + (int) (g.getSpray() / 2 - 1) + "}] run scoreboard players add @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=" + (int) (g.getSpray() / 2 + 1) + "..}] run scoreboard players remove @s rng " + (int) (g.getSpray() / 4));
            for (int i = 0; i < g.getSpray(); i++) {
                FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s rng matches " + i + " if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~" + (i - (int) (g.getSpray() / 2)) + " ~ run function flytre:guns/fire2_" + g.getId());
                FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s rng matches " + i + " if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~" + (i - (int) (g.getSpray() / 2)) + " ~ run function flytre:guns/fire2_" + g.getId());
            }
        } else {
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s gunSneak matches 0 positioned ~ ~1.6 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_" + g.getId());
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_" + g.getId());
        }

        FunctionWriter.makeFunction("guns/fire2_" + g.getId());

        if (g.getSpray() >= 1) {
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "function flytre:rand_num");
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "scoreboard players operation @s rng = num rng");
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "scoreboard players operation @s rng %= " + g.getId() + " spray");


            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=.." + (int) (g.getSpray() / 2 - 1) + "}] run scoreboard players add @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=" + (int) (g.getSpray() / 2 + 1) + "..}] run scoreboard players remove @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s gunSneak 0");


            for (int i = 0; i < g.getSpray(); i++)
                FunctionWriter.addStatment("guns/fire2_" + g.getId(), "execute if score @s rng matches " + i + " rotated ~ ~" + (i - (int) (g.getSpray() / 2)) + " run function flytre:guns/beam_" + g.getId());
        } else {
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "function flytre:guns/beam_" + g.getId());

        }

        FunctionWriter.makeFunction("guns/beam_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players add @s travel_time 1");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[scores={travel_time=4..}] run scoreboard players set @s travel_time 0");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players add @s range 1");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players operation @s damage *= " + g.getId() + " dropoff");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players operation @s damage /= 10000 dropoff");


        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_" + g.getId());

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_" + g.getId());


        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue,scores={travel_time=0}] run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green,scores={travel_time=0}] run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1 force");

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] unless entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] unless entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());


        FunctionWriter.makeFunction("guns/damage_" + g.getId());
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players set @a[distance=..0.7,tag=t_" + g.getId() + "] armor2 100");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "effect give @a[distance=..0.7,tag=t_" + g.getId() + "] instant_damage 1 0 true");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[distance=..0.7,tag=t_" + g.getId() + "] add shot");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @a[distance=..0.7,tag=t_" + g.getId() + "] armor2 -= " + g.getId() + " armorPen");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] run scoreboard players operation @s armor2 *= @s armor");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] run scoreboard players operation @s armor2 /= 100 dropoff");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players set @s damage2 100");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players add @s range 1000000");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_" + g.getId() + "] armor2");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage *= @s damage2");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage /= 100 dropoff");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @a[distance=..0.7,tag=t_" + g.getId() + "] health -= @s damage");

        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~");


        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=!quadKill] run tellraw @a [\"\",{\"selector\":\"@p[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + "]\",\"color\":\"yellow\"},{\"text\":\" was tagged by \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] run scoreboard players add @s kills 1");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] run scoreboard players add @s kills2 1");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=quadKill] run tellraw @a [\"\",{\"selector\":\"@p[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + "]\",\"color\":\"yellow\"},{\"text\":\" lost their streak to \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=quadKill] run tag @s remove quadKill");


        FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] add gun_death");

        FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[distance=..0.7,tag=t_" + g.getId() + "] remove t_" + g.getId() + "");
        FunctionWriter.addStatment("guns/damage_" + g.getId(), "function flytre:sync_xp");

        String[] lore = null;
        if (g.getType().equals("shotgun"))
            lore = new String[]{"§7Damage: §c" + (int) g.getDamage(), "§7Speed: §c" + g.getRps(), "§7Range: §c" + (int) g.getRange(), "§7Spray: §c" + (int) g.getSpray(), "§7Armor Pierce: §c" + (int) g.getArmor_pen() + "%", "§7Dropoff: §c" + g.getDropoff(), "§7Projectiles: §c5"};
        else if (g.getType().equals("sniper"))
            lore = new String[]{"§7Damage: §c" + (int) g.getDamage(), "§7Speed: §c" + g.getRps(), "§7Range: §c" + (int) g.getRange(), "§7Spray: §c" + (int) g.getSpray(), "§7Armor Pierce: §c" + (int) g.getArmor_pen() + "%", "§7Dropoff: §c" + g.getDropoff(), "§7Movement Speed: §c-10%"};
        else
            lore = new String[]{"§7Damage: §c" + (int) g.getDamage(), "§7Speed: §c" + g.getRps(), "§7Range: §c" + (int) g.getRange(), "§7Spray: §c" + (int) g.getSpray(), "§7Armor Pierce: §c" + (int) g.getArmor_pen() + "%", "§7Dropoff: §c" + g.getDropoff()};

        int model = 0;
        if (g.getType().equals("pistol"))
            model = 1;
        if (g.getType().equals("sniper"))
            model = 3;
        if (g.getType().equals("smg") || g.getType().equals("rifle"))
            model = 5;
        if (g.getType().equals("shotgun"))
            model = 12;

        ShopItem si = null;
        if (g.getType().equals("sniper"))
            si = new ShopItem(g.getId(), "carrot_on_a_stick", g.getName(), lore, g.getCost(), "ability:\"" + g.getId() + "\",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:\"generic.movementSpeed\",Name:\"generic.movementSpeed\",Amount:-0.1,Operation:1,UUIDLeast:"+(int)(Math.random()*100000)+",UUIDMost:"+(int)((Math.random()*100000)+100000)+",Slot:\"mainhand\"}]");
        else
            si = new ShopItem(g.getId(), "carrot_on_a_stick", g.getName(), lore, g.getCost(), "ability:\"" + g.getId() + "\",scope:1");

        si.setNbtGreen("CustomModelData:" + model);
        si.setNbtBlue("CustomModelData:" + (model + 1));

        addShopItem(si);


        CustomAbility cag = null;
        if (!g.getType().equals("shotgun"))
            cag = new CustomAbility.Builder(g.getId()).effect("function flytre:guns/fire_" + g.getId()).cooldown((int) (20 / g.getRps())).build();
        else
            cag = new CustomAbility.Builder(g.getId()).effect("function flytre:guns/initiate_" + g.getId()).cooldown((int) (20 / g.getRps())).build();
        addAbility(cag,si);
    }

    static void postInitializeGun() {
    }


    public static void main(String[] args) throws InvalidItemException {


        initialize();

        ParticleShape respawn = new ParticleHelix("helix", 2, "smoke", 3, 2);
        addParticle(respawn);

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



        initializeGun();
        initializeAbility();



        //shop
        ShopItem saber_1 = new ShopItem("saber_1", "carrot_on_a_stick", "§rSaber", new String[]{"§7Damage: §c7", "§7Speed: §c1.5", "§7Armor Pierce: §c100%", "§7Health Regen: §c+10 §7hp/sec"}, 25, "HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:\"generic.attackDamage\",Name:\"generic.attackDamage\",Amount:13,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:\"mainhand\"},{AttributeName:\"generic.attackSpeed\",Name:\"generic.attackSpeed\",Amount:-2.5,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:\"mainhand\"}],type:\"saber\"");
        saber_1.setNbtGreen("CustomModelData:7");
        saber_1.setNbtBlue("CustomModelData:8");

        ShopItem saber_2 = new ShopItem("saber_2", "carrot_on_a_stick", "§rSaber", new String[]{"§7Damage: §c10", "§7Speed: §c1.5", "§7Armor Pierce: §c100%", "§7Health Regen: §c+10 §7hp/sec"}, 55, "HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:\"generic.attackDamage\",Name:\"generic.attackDamage\",Amount:20,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:\"mainhand\"},{AttributeName:\"generic.attackSpeed\",Name:\"generic.attackSpeed\",Amount:-2.5,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:\"mainhand\"}],type:\"saber\"");
        saber_2.setNbtGreen("CustomModelData:7");
        saber_2.setNbtBlue("CustomModelData:8");

        addShopItem(saber_1);
        addShopItem(saber_2);
        ShopItem toughened_vest = new ShopItem("toughened_vest", "leather_chestplate", "§rToughened Vest", new String[]{"§7Armor: §c20%"}, 10, "armor:20,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        toughened_vest.setColorBlue(262348);
        toughened_vest.setColorGreen(4325135);
        addShopItem(toughened_vest);

        ShopItem combat_vest = new ShopItem("combat_vest", "leather_chestplate", "§rCombat Vest", new String[]{"§7Armor: §c40%"}, 30, "armor:40,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_vest.setColorBlue(262348);
        combat_vest.setColorGreen(4325135);
        addShopItem(combat_vest);

        ShopItem toughened_legs = new ShopItem("toughened_legs", "leather_leggings", "§rToughened Pants", new String[]{"§7Armor: §c15%"}, 10, "armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        toughened_legs.setColorBlue(262348);
        toughened_legs.setColorGreen(4325135);
        addShopItem(toughened_legs);

        ShopItem combat_legs = new ShopItem("combat_legs", "leather_leggings", "§rCombat Pants", new String[]{"§7Armor: §c30%"}, 25, "armor:30,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_legs.setColorBlue(262348);
        combat_legs.setColorGreen(4325135);
        addShopItem(combat_legs);

        ShopItem trooper_boots = new ShopItem("trooper_boots", "leather_boots", "§rTrooper Boots", new String[]{"§7Armor: §c15%"}, 10, "armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        trooper_boots.setColorBlue(262348);
        trooper_boots.setColorGreen(4325135);
        addShopItem(trooper_boots);

        ShopItem combat_boots = new ShopItem("combat_boots", "leather_boots", "§rCombat Boots", new String[]{"§7Armor: §c25%"}, 20, "armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:\"minecraft:binding_curse\",lvl:1}],Unbreakable:1b");
        combat_boots.setColorBlue(262348);
        combat_boots.setColorGreen(4325135);
        addShopItem(combat_boots);

        ShopItem dasher = new ShopItem("dash", "carrot_on_a_stick", "§eDash", new String[]{"§7Gain Speed §62§7 for §65§7 seconds.", "§7The same ability does §cNOT§7 stack."}, 15, "ability:\"dash\",CustomModelData:9");
        addShopItem(dasher);

        ShopItem blinker = new ShopItem("blink", "carrot_on_a_stick", "§eBlink", new String[]{"§7Teleport up to §68§7 blocks forward.", "§7Aim slightly upwards for better results.", "§7The same ability does §cNOT§7 stack."}, 20, "ability:\"blink\",CustomModelData:10");
        addShopItem(blinker);

        ShopItem weakheal = new ShopItem("weak_heal", "carrot_on_a_stick", "§eWeak Heal", new String[]{"§7Heal §63.0§7 hearts.", "§7The same ability does §cNOT§7 stack."}, 15, "ability:\"weak_heal\",CustomModelData:11");
        addShopItem(weakheal);

        ShopItem strongheal = new ShopItem("strong_heal", "carrot_on_a_stick", "§eStrong Heal", new String[]{"§7Heal §66.0§7 hearts.", "§7The same ability does §cNOT§7 stack."}, 25, "ability:\"strong_heal\",CustomModelData:11");
        addShopItem(strongheal);

        CustomGun shotty = new CustomGun("shotty", 7, 50, 1, 0.09, 18, 8, "flytre.shotgun.fire", "§6Omega §rShowstopper", 65, "shotgun");
        addGun(shotty);

        ShopItem concussion = new ShopItem("team_heal", "carrot_on_a_stick", "§eTeam Heal", new String[]{"§7Heal your team for §61.5§7 hearts.", "§7The same ability does §cNOT§7 stack for the same person."}, 25, "ability:\"team_heal\",CustomModelData:16");
        addShopItem(concussion);

        ShopItem spectraleye = new ShopItem("spectral_eye", "carrot_on_a_stick", "§eSpectral Eye", new String[]{"§7Reveal players within §612§7 blocks.", "§7The same ability does §cNOT§7 stack."}, 20, "ability:\"spectral_eye\",CustomModelData:15");
        addShopItem(spectraleye);


        CustomGun soft_sniper = new CustomGun("soft_sniper", 13, 70, 0.4, 0.0, 2, 50, "flytre.sniper.fire", "§6SpaceTech §rSeeker", 55, "sniper");
        CustomGun hard_sniper = new CustomGun("hard_sniper", 22, 95, 0.18, 0.0, 0, 50, "flytre.sniper.fire", "§6FlyteForce §rNightmare", 95, "sniper");

        CustomGun pistol_1 = new CustomGun("pistol_1", 5, 20, 3, 0.06, 12, 30, "flytre.pistol.fire", "§6Nova §rLethalMark", 25, "pistol");
        CustomGun pistol_2 = new CustomGun("pistol_2", 8, 40, 2, 0.06, 10, 20, "flytre.pistol.fire", "§6Nova §rBeamer", 30, "pistol");
        CustomGun pistol_3 = new CustomGun("pistol_3", 6, 10, 4, 0.08, 21, 15, "flytre.pistol.fire", "§6Omega §rLaserSpeed", 30, "pistol");

        CustomGun smg = new CustomGun("smg", 4, 40, 8, 0.07, 20, 12, "flytre.assault_rifle.fire", "§6FlyteForce §rRapidStrike", 70, "smg");

        CustomGun ar_1 = new CustomGun("ar_1", 6, 50, 6, 0.04, 15, 20, "flytre.assault_rifle.fire", "§6SpaceTech §rHunter", 70, "rifle");
        CustomGun ar_2 = new CustomGun("ar_2", 5, 70, 4, 0.01, 10, 25, "flytre.assault_rifle.fire", "§6Omega §rBlaster", 50, "rifle");

        addGun(soft_sniper);
        addGun(hard_sniper);
        addGun(pistol_1);
        addGun(pistol_2);
        addGun(pistol_3);
        addGun(smg);
        addGun(ar_1);
        addGun(ar_2);


        //particles
        addParticle(new ParticleTriangle("heal_1", "heart", 3));
        addParticle(new ParticleCircle("heal_2", 3, "heart", 10));
        addParticle(new ParticleTriPyramid("spectral_eye", "dripping_water", 2, 3));


        //abilities
        CustomAbility dash = new CustomAbility.Builder("dash").message("You have used dash!").cooldown(300).displayName("§eDash").effect("effect give @s speed 6 1 true").overTimeDuration(100).overTimeEffect("particle minecraft:cloud ~ ~-.1 ~0 0 .05 0 0 8 force").sound("block.beacon.activate").build();

        CustomAbility blink = new CustomAbility.Builder("blink").message("You have blinked!").cooldown(400).displayName("§eBlink").effect("function flytre:abilities/blink_effect").sound("entity.enderman.teleport").build();

        CustomAbility weak_heal = new CustomAbility.Builder("weak_heal").message("You have healed!").cooldown(350).displayName("§eWeak Heal").effect(new String[]{"execute rotated 180 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_2", "scoreboard players set @s[scores={health=1400..}] health 2000", "scoreboard players add @s[scores={health=..1399}] health 600"}).sound("flytre.powerup.1").build();
        CustomAbility strong_heal = new CustomAbility.Builder("strong_heal").message("You have healed!").cooldown(400).displayName("§eStrong Heal").effect(new String[]{"execute rotated 180 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_2", "scoreboard players set @s[scores={health=800..}] health 2000", "scoreboard players add @s[scores={health=..799}] health 1200"}).sound("flytre.powerup.1").build();

        CustomAbility team_heal = new CustomAbility.Builder("team_heal").message("You have healed your team!").cooldown(450).displayName("§eTeam Heal").effect(new String[]{"execute rotated 180 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_1", "execute rotated 0 0 run function flytre:particles/heal_2", "execute as @a[team=green] run scoreboard players set @s[team=green,scores={health=1600..}] health 2000", "execute as @s[team=green] run scoreboard players add @a[team=green,scores={health=..1599}] health 400", "execute as @a[team=blue] run scoreboard players set @s[team=blue,scores={health=1600..}] health 2000", "execute as @s[team=blue] run scoreboard players add @a[team=blue,scores={health=..1599}] health 400"}).sound("flytre.powerup.1").build();
        CustomAbility spectral = new CustomAbility.Builder("spectral_eye").message("Your spectral eye has activated, revealing nearby enemies!").cooldown(500).displayName("§eSpectral Eye").effect(new String[]{"execute rotated ~ 0 run function flytre:particles/spectral_eye", "execute as @s[team=blue] run effect give @a[team=green,distance=..18] glowing 5 0 true", "execute as @s[team=green] run effect give @a[team=blue,distance=..18] glowing 5 0 true"}).sound("flytre.powerup.2").build();


        addAbility(weak_heal, weakheal);
        addAbility(strong_heal, strongheal);
        addAbility(dash, dasher);
        addAbility(blink, blinker);
        addAbility(team_heal, concussion);
        addAbility(spectral, spectraleye);




        postInitializeAbility();
        postInitializeGun();

        FunctionWriter.addStatment("shop_base", "scoreboard players set @a trigger 0");

    }
}
