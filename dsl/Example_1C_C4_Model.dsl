workspace "1С:Система пример" "Модель C4 для конфигурации 1С" {

    model {
    
        !include model/main.dsl
        !include model/otherSystems.dsl

        # Взаимодействия уровня системного контекста
        OtherSystemUser -> OtherSystem1 "Вводит данные"
        OtherSystemAdmin -> OtherSystem3 "Администрирует ПО"
        OtherSystem1 -> System1C "Передача данных по НСИ" "AMQP"
        System1C -> OtherSystem2 "Передача остатков по складам" "HTTPS"
        OtherSystem2 -> OtherSystem3 "Собирает данные для BI" "TCP"

        # Взаимодействие уровня контейнеров (подсистем)
        SystemUser2 -> SubsysReporting "Смотрит отчеты"
        SubsysReporting -> SubsysGoodsObjects "Получает информацию для отчетности"
        SubsysServiceObjects -> SubsysGoodsObjects "Передает информацию по товарам для интеграции"
        SubsysGoodsObjects -> StandardSubsystemsLibrary "Использует стандартные подсистемы"

        # Взаимодействие уровня компонентов (объектов)
        ## Подсистема Учет товаров
        SystemUser1 -> Doc_MovementsOfGoods "Вводит данные"
        Enum_GoodsType -> Cat_Goods "Определяет вид товара"
        InfoReg_GoodsCosts -> Doc_MovementsOfGoods "Определяет цену товара"
        Cat_Goods -> Doc_MovementsOfGoods "Ссылается на товар"
        Doc_MovementsOfGoods -> AccumReg_RemainingGoods "Записывает информацию по остаткам товаров" 
        
    }
    
    views {

        systemlandscape "SystemLandscape" {
            include *
            autolayout lr
        }

        systemContext System1C {
            include *
            autolayout lr
        }

        container System1C {
            include *
            autolayout lr
        }
        
        component SubsysGoodsObjects GO "Подсистема Учет товаров" {
            include *
            autoLayout lr
        }

        styles {
            !include views/style.dsl    
        }

    }
}