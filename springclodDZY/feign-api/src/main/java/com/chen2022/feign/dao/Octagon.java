package com.chen2022.feign.dao;

public class Octagon implements Cloneable,Comparable<Octagon>{

    @Override
    public int compareTo(Octagon o) {
        return 0;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
