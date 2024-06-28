#Пользователи
SystemUser1 = person "Пользователь-исполнитель"
SystemUser2 = person "Пользователь-руководитель"

#Системы
System1C = softwareSystem "Система на платформе 1С" {
    SubsysGoodsObjects = container "Учет товаров" "" "Подсистема" "Подсистемы" {
        Cat_Goods = component "Товары" "" "Справочник" "Справочники"         
        Doc_MovementsOfGoods = component "Перемещение товаров" "" "Документ" "Документы"
        Enum_GoodsType = component "Виды товаров" "" "Перечисление" "Перечисления"
        InfoReg_GoodsCosts = component "Стоимость товаров" "" "Регистр сведений" "Регистры сведений"
        AccumReg_RemainingGoods = component "Остатки товаров" "" "Регистр накопления" "Регистры накопления"
    }
    SubsysReporting = container "Отчетность" "" "Подсистема" "Подсистемы" {
        Rep_RemainingGoods = component "Отчет по остаткам" "" "Справочник" "Справочники"
    }
    SubsysServiceObjects = container "Сервисные объекты" "" "Подсистема" "Подсистемы" {
        Cat_IntegrationsSettings = component "Настройки интеграции" "" "Справочник" "Справочники"
        Ext_SystemIntegration = component "Интеграция с внешней системой" "" "Обработка" "Обработки"
        InfoReg_ObjectMapping = component "Соответствие объектов" "" "Регистр сведений" "Регистры сведений"
    }
    StandardSubsystemsLibrary = container "Библиотека стандартных подсистем" "" "Набор подсистем" "Подсистемы"
}