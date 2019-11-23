package com.flytre.CustomItems;

public class ShopItem {
    private final String itemID;
    private String name;
    private String[] lore;
    private int cost;
    private String nbtNoBrackets;
    private String id;
    private String nbtGreen;
    private String nbtBlue;
    private int colorGreen;
    private int colorBlue;


    public ShopItem(String id, String itemID, String name, String[] lore, int cost, String nbtNoBrackets) {
        this.id = id;
        this.name = name;
        this.lore = lore;
        this.cost = cost;
        this.nbtNoBrackets = nbtNoBrackets;
        this.itemID = itemID;
        nbtGreen = "";
        nbtBlue = "";
        colorGreen = -1;
        colorBlue = -1;

    }

    public String getName() {
        return name;
    }

    public String[] getLore() {
        return lore;
    }

    public int getCost() {
        return cost;
    }

    public String getNbtNoBrackets() {
        return nbtNoBrackets;
    }

    public String getId() {
        return id;
    }

    public String getItemID() {
        return itemID;
    }

    public String getNbtGreen() {
        return nbtGreen;
    }

    public void setNbtGreen(String nbtGreen) {
        this.nbtGreen = nbtGreen;
    }

    public String getNbtBlue() {
        return nbtBlue;
    }

    public void setNbtBlue(String nbtBlue) {
        this.nbtBlue = nbtBlue;
    }

    public int getColorGreen() {
        return colorGreen;
    }

    public void setColorGreen(int colorGreen) {
        this.colorGreen = colorGreen;
    }

    public int getColorBlue() {
        return colorBlue;
    }

    public void setColorBlue(int colorBlue) {
        this.colorBlue = colorBlue;
    }
    
    
    public String getFullNBTGreen() {

        return "{display:{Name:\"\\\"" + getName() + "\\\"\",Lore:[" + String.join(",", getLore()) + "]" + (getColorGreen() != -1 ? "," + "color:" + getColorGreen() : "") + "}" + (getNbtNoBrackets().length() > 0 ? "," + getNbtNoBrackets() : "") + (getNbtGreen().length() > 0 ? "," + getNbtGreen() : "") + "}";
        
    }

    public String getFullNBTBlue() {
        return "{display:{Name:\"\\\"" + getName() + "\\\"\",Lore:[" + String.join(",", getLore()) + "]" + (getColorBlue() != -1 ? "," + "color:" + getColorBlue() : "") + "}" + (getNbtNoBrackets().length() > 0 ? "," + getNbtNoBrackets() : "") + (getNbtBlue().length() > 0 ? "," + getNbtBlue() : "") + "}";

    }
}
