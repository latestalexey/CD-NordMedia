﻿ВЫБРАТЬ
	ПеремещениеТоваровТовары.Номенклатура,
	СУММА(ПеремещениеТоваровТовары.Количество) КАК Количество,
	ПеремещениеТоваровТовары.Цена,
	СУММА(ПеремещениеТоваровТовары.Сумма) КАК Сумма
ПОМЕСТИТЬ ВТ_ТабличнаяЧасть
ИЗ
	Документ.ПеремещениеТоваров.Товары КАК ПеремещениеТоваровТовары
		ЛЕВОЕ СОЕДИНЕНИЕ Документ.ПеремещениеТоваров КАК ПеремещениеТоваров
		ПО ПеремещениеТоваровТовары.Ссылка = ПеремещениеТоваров.Ссылка
ГДЕ
	ПеремещениеТоваров.Ссылка = &Ссылка
	И ПеремещениеТоваровТовары.Номенклатура.ТипНоменклатуры = ЗНАЧЕНИЕ(Перечисление.ТипыНоменклатуры.Товар)

СГРУППИРОВАТЬ ПО
	ПеремещениеТоваровТовары.Номенклатура,
	ПеремещениеТоваровТовары.Цена
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ
	ВТ_ТабличнаяЧасть.Номенклатура,
	ВТ_ТабличнаяЧасть.Количество,
	ВТ_ТабличнаяЧасть.Цена * ВТ_ТабличнаяЧасть.Количество КАК Себестоимость,
	ВТ_ТабличнаяЧасть.Цена * ВТ_ТабличнаяЧасть.Количество КАК Сумма,
	ВТ_ТабличнаяЧасть.Цена КАК Цена,
	ВТ_ТабличнаяЧасть.Номенклатура.ЕдиницаИзмерения КАК ЕдиницаИзмерения
ИЗ
	ВТ_ТабличнаяЧасть КАК ВТ_ТабличнаяЧасть
		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.СебестоимостьНоменклатуры.СрезПоследних(&Период, Магазин = &Магазин) КАК СебестоимостьНоменклатурыСрезПоследних
		ПО ВТ_ТабличнаяЧасть.Номенклатура = СебестоимостьНоменклатурыСрезПоследних.Номенклатура
