package com.chen2022.cudsapi.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Pattern;

public class test {

    public static void main(String[] args) {
        ArrayList<String> strings = new ArrayList<>(Arrays.asList("a", "b", "c"));
        strings.add("ss");
        System.out.println(strings.size());
        System.out.println(strings.get(3));
    }
}
