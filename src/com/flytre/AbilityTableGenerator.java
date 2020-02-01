package com.flytre;

import com.flytre.CustomItems.CustomAbility;
import com.flytre.CustomItems.ShopItem;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;



public class AbilityTableGenerator {


    private static JSONParser parser = new JSONParser();
    private JSONObject json;
    private JSONObject demoPool;
    private JSONArray pools;

    public AbilityTableGenerator(CustomAbility ca, ShopItem si) {

        if(ca.getCooldown() >= 25) {
            createJSONFile(ca, si, ca.getId(),ca.getId() + "_cd",ca.getCharges() > 1);
            createMCFunc(ca, ca.getId());
        }

        if(ca.getCharges() > 1) {
            int oldCooldown = ca.getCooldown();

            ca.setCooldown(ca.getReloadTime());
            createJSONFile(ca, si, ca.getId() + "_reload", ca.getId() + "_rl", false);
            createMCFunc(ca, ca.getId() + "_reload");

            ca.setCooldown(oldCooldown);

            createNameJSON(ca, si, ca.getId() + "_clip", ca.getId() + "_cl");
            createMCFunc(ca, ca.getId() + "_clip");
        }

    }

    private void createNameJSON(CustomAbility ca, ShopItem si,String name, String objective) {
            FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/" + name + ".json");


            String template = readFile("src/com/flytre/template.json");
            if (template == null)
                return;

            try {
                json = (JSONObject) parser.parse(template);
            } catch (ParseException e) {
                return;
            }

            if (json == null)
                return;

            pools = ((JSONArray) json.get("pools"));
            demoPool = (JSONObject) pools.get(0);
            pools.clear();

        for(int i = 1; i <= ca.getCharges(); i++) {
            String nbt = si.getFullNBTBlue();
            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),objective,i,i);
            addNBT(getPoolFunctions(newPool),nbt);
            addName(getPoolFunctions(newPool),si.getName(),i);
        }

            FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+name+"_blue.json");


            FileHandler.print(json.toJSONString());

            pools.clear();

        for(int i = 1; i <= ca.getCharges(); i++) {
            String nbt = si.getFullNBTGreen();
            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),objective,i,i);
            addNBT(getPoolFunctions(newPool),nbt);
            addName(getPoolFunctions(newPool),si.getName(),i);
        }

            FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+name+"_green.json");

            FileHandler.print(json.toJSONString());
    }

    private void createMCFunc(CustomAbility ca, String name) {

        FunctionWriter.makeFunction("abilities/loot/" + name);
        for(int i = 0; i < 9; i++) {
            FunctionWriter.addStatment("abilities/loot/" + name,"execute as @s[team=blue,nbt={Inventory:[{Slot:"+i+"b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s hotbar."+i+" loot flytre:abilities/"+name+"_blue");
            FunctionWriter.addStatment("abilities/loot/" + name,"execute as @s[team=green,nbt={Inventory:[{Slot:"+i+"b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s hotbar."+i+" loot flytre:abilities/"+name+"_green");
        }
        FunctionWriter.addStatment("abilities/loot/" + name,"execute as @s[team=blue,nbt={Inventory:[{Slot:-106b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s weapon.offhand loot flytre:abilities/"+name+"_blue");
        FunctionWriter.addStatment("abilities/loot/" + name,"execute as @s[team=green,nbt={Inventory:[{Slot:-106b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s weapon.offhand loot flytre:abilities/"+name+"_green");

    }


    private void createJSONFile(CustomAbility ca, ShopItem si,String name, String objective,boolean copyName) {
        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/" + name + ".json");


        String template = readFile("src/com/flytre/template.json");
        if (template == null)
            return;

        try {
            json = (JSONObject) parser.parse(template);
        } catch (ParseException e) {
            return;
        }

        if (json == null)
            return;

        pools = ((JSONArray) json.get("pools"));
        demoPool = (JSONObject) pools.get(0);
        pools.clear();

        for(int i = 0; i < 25; i++) {
            String nbt = si.getFullNBTBlue();

            nbt = (i == 0 ? nbt : nbt.substring(0,nbt.length() - 1) + ",reloading:1}");


            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),objective,-(ca.getCooldown()*(i+1)/25) + 1,-(ca.getCooldown()*(i)/25));
            addNBT(getPoolFunctions(newPool),nbt);
            addDamage(getPoolFunctions(newPool),1-(i/24.0));
            if(copyName) {
                copyName(getPoolFunctions(newPool),ca);
            }
        }

        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+name+"_blue.json");

        FileHandler.print(json.toJSONString());

        pools.clear();

        for(int i = 0; i < 25; i++) {
            String nbt = si.getFullNBTGreen();

            nbt = (i == 0 ? nbt : nbt.substring(0,nbt.length() - 1) + ",reloading:1}");

            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),objective,-(ca.getCooldown()*(i+1)/25) + 1,-(ca.getCooldown()*(i)/25));
            addNBT(getPoolFunctions(newPool),nbt);
            addDamage(getPoolFunctions(newPool),1-(i/24.0));
            if(copyName)
                copyName(getPoolFunctions(newPool),ca);
        }

        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+name+"_green.json");

        FileHandler.print(json.toJSONString());
    }

    private JSONArray getPoolConditions(JSONObject pool) {
        return (JSONArray) pool.get("conditions");

    }

    private JSONArray getPoolFunctions(JSONObject pool) {
        return ((JSONArray) ((JSONObject) ((JSONArray) pool.get("entries")).get(0)).get("functions"));
    }


    private JSONObject addPool() {

        try {
            JSONObject pool = (JSONObject) parser.parse(demoPool.toJSONString());
            pools.add(pool);
            return pool;
        } catch (ParseException e) {
            return null;
        }

    }

    private boolean addNBT(JSONArray functions, String nbt) {
        try {


            JSONObject func = (JSONObject) parser.parse("{\n" +
                            "              \"function\": \"minecraft:set_nbt\",\n" +
                            "            }");
            func.put("tag",nbt);
            functions.add(func);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    private boolean copyName(JSONArray functions, CustomAbility ca) {
        try {


            JSONObject func = (JSONObject) parser.parse("{\n" +
                    "              \"function\": \"minecraft:copy_nbt\",\n" +
                    "            }");
            func.put("source","this");

            JSONArray ops = new JSONArray();
            JSONObject op = new JSONObject();
            op.put("source","SelectedItem.tag.display.Name");
            op.put("target", "display.Name");
            op.put("op", "replace");

            ops.add(op);
            func.put("ops",ops);

            JSONObject cond = null;
            try {
                cond = (JSONObject)  parser.parse("{\n" +
                        "                  \"condition\": \"minecraft:entity_properties\",\n" +
                        "                  \"entity\": \"this\",\n" +
                        "                  \"predicate\": {\n" +
                        "                    \"nbt\": \"{SelectedItem:{tag:{ability:\\\"" + ca.getId() + "\\\"}}}\"\n" +
                        "                  }\n" +
                        "                }\n");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            functions.add(func);
            if(cond != null) {
                JSONArray conds = new JSONArray();
                conds.add(cond);
                func.put("conditions",conds);
            }
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    private boolean addName(JSONArray functions, String name, int clip) {
        try {


            JSONObject func = (JSONObject) parser.parse("{\n" +
                    "              \"function\": \"minecraft:set_name\",\n" +
                    "            }");
            func.put("entity","this");
            func.put("name",name + " §e(" + clip  +")");
            functions.add(func);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    private boolean addDamage(JSONArray functions, double damage) {
        try {
            functions.add(parser.parse("{\n" +
                    "              \"function\": \"minecraft:set_damage\",\n" +
                    "              \"damage\": "+damage+"\n" +
                    "            }"));
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    private boolean addScoreReq(JSONArray conditions,String objectiveName, int min, int max) {

        if(min > max)
            min = max;

        try {
            conditions.add(parser.parse("{\n" +
                    "          \"condition\": \"minecraft:entity_scores\",\n" +
                    "          \"entity\": \"this\",\n" +
                    "          \"scores\": {\n" +
                    "            \""+objectiveName+"\": {\n" +
                    "              \"min\": "+min+",\n" +
                    "              \"max\": "+max+"\n" +
                    "            }\n" +
                    "          }\n" +
                    "        }"));
        } catch (ParseException e) {
            return false;
        }

        return true;
    }


    private static String readFile(String filepath) {
        String line = null;
        StringBuilder stringBuilder = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new FileReader(filepath));) {
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
                stringBuilder.append(System.getProperty("line.separator"));
            }

            return stringBuilder.toString();
        } catch (IOException e) {
            return null;
        }
    }


    public static void main(String[] args) throws InvalidItemException {
        CustomAbility dash = new CustomAbility.Builder("dash").message("You have used dash!").cooldown(300).displayName("§eDash").effect("effect give @s speed 6 1 true").overTimeDuration(100).overTimeEffect("particle minecraft:cloud ~ ~-.1 ~0 0 .05 0 0 8 force").sound("block.beacon.activate").build();
        ShopItem dasher = new ShopItem("dash", "carrot_on_a_stick", "§eDash", new String[]{"§7Gain Speed §62§7 for §65§7 seconds.", "§7The same ability does §cNOT§7 stack."}, 15, "ability:\"dash\",CustomModelData:9");
        System.out.println(dasher.getNbtNoBrackets());
        AbilityTableGenerator atg = new AbilityTableGenerator(dash,dasher);

    }

}
