﻿Запросы.ОприходованиеТоваров.УстановитьПараметр("Ссылка", Источник.Ссылка);
Запросы.ОприходованиеТоваров.УстановитьПараметр("Магазин", Источник.Магазин);
Запросы.ОприходованиеТоваров.УстановитьПараметр("Период", КонецМесяца(Источник.Дата));

РезультатыЗапроса = Запросы.ОприходованиеТоваров.Выполнить();
ВходящиеДанные = Новый Структура;
ВходящиеДанные.Вставить("Товары", РезультатыЗапроса.Выгрузить());
