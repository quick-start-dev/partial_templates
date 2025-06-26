import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart'; {{! change this !}}

{{#range components.schemas }}
class {{.__key}}Model{
  {{#range .__value.properties}}
      @jsonKey(name:'{{.__key}}')
      final {{.__value.openAPIType('dart')}} {{.__key.toCamelCase()}}; {{#if .__value.containsKey('enum')}} // {{.__value.enum}} {{%}}
  {{%}}
  
  {{.__key}}Model({
    {{#range .__value.properties}}
      required this.{{.__key}},
  {{%}}
  });
  
  factory {{.__key}}Model.fromJson(Map<String,dynamic> json)=> _${{.__key}}ModelFromJson(json);
  
  
  Map<String,dynamic> toJson() => _${{.__key}}ModelToJson(this);
}
{{%}}