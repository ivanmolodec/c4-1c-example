#Пользователи
OtherSystemUser = person "Пользователь внешней системы"
OtherSystemAdmin = person "Администратор внешней системы"

#Системы
OtherSystem1 = softwareSystem "Внешняя система 1" {
    OS1webAPI = container "Web API системы 1" "" "" "API"
    OS1webApp = container "Приложение системы 1" "" "" "Клиент"
    OS1database = container "База данных системы 1" "" "" "База данных"
}
OtherSystem2 = softwareSystem "Внешняя система 2" {
    OS2webAPI = container "Web API системы 2" "" "" "API"
    OS2webApp = container "Приложение системы 2" "" "" "Клиент"
    OS2database = container "База данных системы 2" "" "" "База данных"
}
OtherSystem3 = softwareSystem "Внешняя система 3" {
    OS3webAPI = container "Web API системы 3" "" "" "API"
    OS3webApp = container "Приложение системы 3" "" "" "Клиент"
    OS3database = container "База данных системы 3" "" "" "База данных"
}