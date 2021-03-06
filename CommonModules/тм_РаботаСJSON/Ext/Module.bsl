
// Сериализует объект в строку JSON
// 
// Параметры:
// 	ОбъектСериализации - Произвольный - Объект требующий сериализации
// Возвращаемое значение:
// 	Строка - Полученная в результате сериализации строка JSON
Функция СериализоватьВJSON(ОбъектСериализации,ФормироватьСПереносами = ЛОЖЬ) Экспорт

	Перем НастройкиСериализацииJSON;
	
	НастройкиСериализацииJSON = Новый НастройкиСериализацииJSON;
	НастройкиСериализацииJSON.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.ЛокальнаяДатаСоСмещением;
	НастройкиСериализацииJSON.ФорматСериализацииДаты = ФорматДатыJSON.ISO;

	ЗаписьJSON = Новый ЗаписьJSON;
	
	Если ФормироватьСПереносами Тогда
		ЗаписьJSON.УстановитьСтроку(Новый ПараметрыЗаписиJSON(, Символы.Таб));
	Иначе
		ЗаписьJSON.УстановитьСтроку();
	КонецЕсли; 

	
	
	ЗаписатьJSON(ЗаписьJSON, ОбъектСериализации, НастройкиСериализацииJSON);
	
	Возврат ЗаписьJSON.Закрыть(); 

КонецФункции
 

// Десериализует строку JSON
// 
// Параметры:
// 	СтрокаJSON - Строка - Десериализуемая строка JSON 
// 	ИспользуяСериализатор - Булево - Используется если строка JSON приходит без описания типов 
// 		(например из стороннего сервиса)
// 		
// Возвращаемое значение:
// 	Произвольный - Объект полученный из строки JSON
Функция ДесериализоватьИзJSON(СтрокаJSON, ИменаПолейДат = "") Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(СтрокаJSON); 

	ОбъектИзСтрокиJSON = ПрочитатьJSON(ЧтениеJSON,,ИменаПолейДат, ФорматДатыJSON.ISO); 

	ЧтениеJSON.Закрыть();
	
	Возврат ОбъектИзСтрокиJSON; 
	
КонецФункции


Функция СериализоватьВXML(ОбъектСериализации) Экспорт
	
	ДеревоВОбъектеXDTO = СериализаторXDTO.ЗаписатьXDTO(ОбъектСериализации); 
	МойXML = Новый ЗаписьXML;
	МойXML.УстановитьСтроку();
	ФабрикаXDTO.ЗаписатьXML(МойXML, ДеревоВОбъектеXDTO);
	Возврат МойXML.Закрыть(); 
	
КонецФункции

Функция ДесериализоватьИзXML(XMLСтруктураСериализованногоОбъекта) Экспорт
	
	ЧтениеXMLДанных = Новый ЧтениеXML;
	ЧтениеXMLДанных.УстановитьСтроку(XMLСтруктураСериализованногоОбъекта); 
	Ответ = СериализаторXDTO.ПрочитатьXML(ЧтениеXMLДанных); 
	ЧтениеXMLДанных.Закрыть();
	
	Возврат Ответ; 
	
КонецФункции

