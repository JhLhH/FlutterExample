class TableModelEntity {
	List<TableModelList> xList;

	TableModelEntity({this.xList});

	TableModelEntity.fromJson(Map<String, dynamic> json) {
		if (json['list'] != null) {
			xList = new List<TableModelList>();(json['list'] as List).forEach((v) { xList.add(new TableModelList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TableModelList {
	List<TableModelListPerson> persons;
	String name;
	String campWord;

	TableModelList({this.persons, this.name, this.campWord});

	TableModelList.fromJson(Map<String, dynamic> json) {
		if (json['persons'] != null) {
			persons = new List<TableModelListPerson>();(json['persons'] as List).forEach((v) { persons.add(new TableModelListPerson.fromJson(v)); });
		}
		name = json['name'];
		campWord = json['campWord'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.persons != null) {
      data['persons'] =  this.persons.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['campWord'] = this.campWord;
		return data;
	}
}

class TableModelListPerson {
	String nickName;
	int faceValue;
	String name;
	String saying;
	String officialName;
	int powerValue;
	String url;

	TableModelListPerson({this.nickName, this.faceValue, this.name, this.saying, this.officialName, this.powerValue, this.url});

	TableModelListPerson.fromJson(Map<String, dynamic> json) {
		nickName = json['nickName'];
		faceValue = json['faceValue'];
		name = json['name'];
		saying = json['saying'];
		officialName = json['officialName'];
		powerValue = json['powerValue'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nickName'] = this.nickName;
		data['faceValue'] = this.faceValue;
		data['name'] = this.name;
		data['saying'] = this.saying;
		data['officialName'] = this.officialName;
		data['powerValue'] = this.powerValue;
		data['url'] = this.url;
		return data;
	}
}
