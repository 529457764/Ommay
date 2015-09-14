package com.ommay.entity;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
public class Suit {
	// suit_name varchar(20) default '未定义',
	// suit_number varchar(50) default '0',
	// suit_client_name varchar(50) default '未定义',
	// suit_sex varchar(10) default '女',
	// suit_age_upper int default 99,
	// suit_age_lower int default 0,
	String suit_name = "", suit_number = "", suit_client_name = "",
			suit_sex = "", suit_age_upper = "0", suit_age_lower = "0",
			project_id = "0";

	@Override
	public String toString() {
		return "Suit [suit_name=" + suit_name + ", suit_number=" + suit_number
				+ ", suit_client_name=" + suit_client_name + ", suit_sex="
				+ suit_sex + ", suit_age_upper=" + suit_age_upper
				+ ", suit_age_lower=" + suit_age_lower + ", project_id="
				+ project_id + ", suit_selected_number=" + suit_selected_number
				+ ", suit_sum=" + suit_sum + ", number_item1=" + number_item1
				+ ", number_item2=" + number_item2 + ", number_item3="
				+ number_item3 + ", number_item4=" + number_item4
				+ ", number_item5=" + number_item5 + ", number_item6="
				+ number_item6 + ", number_item7=" + number_item7
				+ ", number_item8=" + number_item8 + ", number_item9="
				+ number_item9 + ", number_item10=" + number_item10
				+ ", number_item11=" + number_item11 + ", number_item12="
				+ number_item12 + ", getSuit_name()=" + getSuit_name()
				+ ", getSuit_number()=" + getSuit_number()
				+ ", getSuit_client_name()=" + getSuit_client_name()
				+ ", getSuit_sex()=" + getSuit_sex() + ", getSuit_age_upper()="
				+ getSuit_age_upper() + ", getSuit_age_lower()="
				+ getSuit_age_lower() + ", getProject_id()=" + getProject_id()
				+ ", getSuit_selected_number()=" + getSuit_selected_number()
				+ ", getSuit_sum()=" + getSuit_sum() + ", getNumber_item1()="
				+ getNumber_item1() + ", getNumber_item2()="
				+ getNumber_item2() + ", getNumber_item3()="
				+ getNumber_item3() + ", getNumber_item4()="
				+ getNumber_item4() + ", getNumber_item5()="
				+ getNumber_item5() + ", getNumber_item6()="
				+ getNumber_item6() + ", getNumber_item7()="
				+ getNumber_item7() + ", getNumber_item8()="
				+ getNumber_item8() + ", getNumber_item9()="
				+ getNumber_item9() + ", getNumber_item10()="
				+ getNumber_item10() + ", getNumber_item11()="
				+ getNumber_item11() + ", getNumber_item12()="
				+ getNumber_item12() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	int suit_selected_number = 0, suit_sum = 0;

	int number_item1 = 0, number_item2 = 0, number_item3 = 0, number_item4 = 0,
			number_item5 = 0, number_item6 = 0, number_item7 = 0,
			number_item8 = 0, number_item9 = 0, number_item10 = 0,
			number_item11 = 0, number_item12 = 0;

	public Suit() {
		suit_name = "";
		suit_number = "";
		suit_client_name = "";
		suit_sex = "";
		suit_age_upper = "0";
		suit_age_lower = "0";
		project_id = "0";
		suit_selected_number = 0;
		suit_sum = 0;

		number_item1 = 0;
		number_item2 = 0;
		number_item3 = 0;
		number_item4 = 0;
		number_item5 = 0;
		number_item6 = 0;
		number_item7 = 0;
		number_item8 = 0;
		number_item9 = 0;
		number_item10 = 0;
		number_item11 = 0;
		number_item12 = 0;
	}

	public String getSuit_name() {
		return suit_name;
	}

	public void setSuit_name(String suit_name) {
		this.suit_name = suit_name;
	}

	public String getSuit_number() {
		return suit_number;
	}

	public void setSuit_number(String suit_number) {
		this.suit_number = suit_number;
	}

	public String getSuit_client_name() {
		return suit_client_name;
	}

	public void setSuit_client_name(String suit_client_name) {
		this.suit_client_name = suit_client_name;
	}

	public String getSuit_sex() {
		return suit_sex;
	}

	public void setSuit_sex(String suit_sex) {
		this.suit_sex = suit_sex;
	}

	public String getSuit_age_upper() {
		return suit_age_upper;
	}

	public void setSuit_age_upper(String suit_age_upper) {
		this.suit_age_upper = suit_age_upper;
	}

	public String getSuit_age_lower() {
		return suit_age_lower;
	}

	public void setSuit_age_lower(String suit_age_lower) {
		this.suit_age_lower = suit_age_lower;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public int getSuit_selected_number() {
		return suit_selected_number;
	}

	public void setSuit_selected_number(int suit_selected_number) {
		this.suit_selected_number = suit_selected_number;
	}

	public int getSuit_sum() {
		return suit_sum;
	}

	public void setSuit_sum(int suit_sum) {
		this.suit_sum = suit_sum;
	}

	public int getNumber_item1() {
		return number_item1;
	}

	public void setNumber_item1(int number_item1) {
		this.number_item1 = number_item1;
	}

	public int getNumber_item2() {
		return number_item2;
	}

	public void setNumber_item2(int number_item2) {
		this.number_item2 = number_item2;
	}

	public int getNumber_item3() {
		return number_item3;
	}

	public void setNumber_item3(int number_item3) {
		this.number_item3 = number_item3;
	}

	public int getNumber_item4() {
		return number_item4;
	}

	public void setNumber_item4(int number_item4) {
		this.number_item4 = number_item4;
	}

	public int getNumber_item5() {
		return number_item5;
	}

	public void setNumber_item5(int number_item5) {
		this.number_item5 = number_item5;
	}

	public int getNumber_item6() {
		return number_item6;
	}

	public void setNumber_item6(int number_item6) {
		this.number_item6 = number_item6;
	}

	public int getNumber_item7() {
		return number_item7;
	}

	public void setNumber_item7(int number_item7) {
		this.number_item7 = number_item7;
	}

	public int getNumber_item8() {
		return number_item8;
	}

	public void setNumber_item8(int number_item8) {
		this.number_item8 = number_item8;
	}

	public int getNumber_item9() {
		return number_item9;
	}

	public void setNumber_item9(int number_item9) {
		this.number_item9 = number_item9;
	}

	public int getNumber_item10() {
		return number_item10;
	}

	public void setNumber_item10(int number_item10) {
		this.number_item10 = number_item10;
	}

	public int getNumber_item11() {
		return number_item11;
	}

	public void setNumber_item11(int number_item11) {
		this.number_item11 = number_item11;
	}

	public int getNumber_item12() {
		return number_item12;
	}

	public void setNumber_item12(int number_item12) {
		this.number_item12 = number_item12;
	}

}
