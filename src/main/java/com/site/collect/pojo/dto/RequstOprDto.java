package com.site.collect.pojo.dto;

import java.util.ArrayList;

/**
 * 访问统计
 */
public class RequstOprDto {
    /**
     * 名称
     */
    private String name;

    /**
     * 值
     */
    private int value;

    private ArrayList netList;

    private ArrayList usrList;

    /**
     * 名称
     */
    private String[] arrName;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public ArrayList getNetList() {
        return netList;
    }

    public void setNetList(ArrayList netList) {
        this.netList = netList;
    }

    public ArrayList getUsrList() {
        return usrList;
    }

    public void setUsrList(ArrayList usrList) {
        this.usrList = usrList;
    }

    public String[] getArrName() {
        return arrName;
    }

    public void setArrName(String[] arrName) {
        this.arrName = arrName;
    }
}
