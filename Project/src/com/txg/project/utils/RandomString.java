package com.txg.project.utils;

import static org.hamcrest.CoreMatchers.containsString;

import java.util.UUID;

import javafx.scene.control.Cell;

public class RandomString {

	public static String generateUUID() {
		UUID uuid = UUID.randomUUID();
		char[] array = uuid.toString().toCharArray();
		for(char c: array) {
			if(c=='-') {
				c='_';
			}
		}
		return array.toString();
	}
}
