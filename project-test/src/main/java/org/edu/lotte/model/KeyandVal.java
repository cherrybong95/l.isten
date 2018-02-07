package org.edu.lotte.model;

public class KeyandVal {
private String key;
private int value;
public KeyandVal() {
	super();
	// TODO Auto-generated constructor stub
}
public KeyandVal(String key, int value) {
	super();
	this.key = key;
	this.value = value;
}
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
}
public int getValue() {
	return value;
}
public void setValue(int value) {
	this.value = value;
}
@Override
public String toString() {
	return "KeyandVal [key=" + key + ", value=" + value + "]";
}

}
