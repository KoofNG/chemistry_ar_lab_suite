class ExperimentModel<T> {

  int _id;
  String _title;
  String _description;
  String _imageName;

  //Data Binding
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get imageName => _imageName;

  ExperimentModel(
    this._title,
    this._description,
    this._imageName
  );

}