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

        createJSONFile(ca,si);
        createMCFunc(ca, si);



    }

    private void createMCFunc(CustomAbility ca, ShopItem si) {
        FunctionWriter.addObj(ca.getId()+"_ud");

        FunctionWriter.makeFunction("abilities/loot/" + ca.getId());
        for(int i = 0; i < 9; i++) {
            FunctionWriter.addStatment("abilities/loot/" + ca.getId(),"execute as @s[team=blue,nbt={Inventory:[{Slot:"+i+"b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s hotbar."+i+" loot flytre:abilities/"+ca.getId()+"_blue");
            FunctionWriter.addStatment("abilities/loot/" + ca.getId(),"execute as @s[team=green,nbt={Inventory:[{Slot:"+i+"b,tag:{ability:\""+ca.getId()+"\"}}]}] run loot replace entity @s hotbar."+i+" loot flytre:abilities/"+ca.getId()+"_green");
        }
    }

    private void createJSONFile(CustomAbility ca, ShopItem si) {
        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/" + ca.getId() + ".json");


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
            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),ca.getId() + "_cd",-(ca.getCooldown()*(i+1)/25) + 1,-(ca.getCooldown()*(i)/25));
            addNBT(getPoolFunctions(newPool),si.getFullNBTBlue());
            addDamage(getPoolFunctions(newPool),1-(i/24.0));

        }

        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+ca.getId()+"_blue.json");

        FileHandler.print(json.toJSONString());

        pools.clear();

        for(int i = 0; i < 25; i++) {
            JSONObject newPool = addPool();
            addScoreReq(getPoolConditions(newPool),ca.getId() + "_cd",-(ca.getCooldown()*(i+1)/25) + 1,-(ca.getCooldown()*(i)/25));
            addNBT(getPoolFunctions(newPool),si.getFullNBTGreen());
            addDamage(getPoolFunctions(newPool),1-(i/24.0));

        }

        FileHandler.setOutput(FunctionWriter.dataLoc + "/flytre/loot_tables/abilities/"+ca.getId()+"_green.json");

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
