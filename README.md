# Пример описания архитектуры системы 1С по модели C4

[![License](https://img.shields.io/github/license/ivanmolodec/c4-1c-example?style=badge)](https://github.com/ivanmolodec/c4-1c-example/blob/develop/LICENSE)

## Диаграммы как код

Подход является составной частью принципа "Архитектура как код", позволяя создавать несколько диаграмм архитектуры программного обеспечения из единой модели при помощи программных языков моделирования. Одной из таких моделей является [C4 (Context Container Component Code)](https://c4model.com/). Данный пример реализован на двух программных языках моделирования: [DSL Structurizr](https://structurizr.com/dsl) и [PUML](https://plantuml.com/).

## Модель C4

Модель С4 довольно трудно полноценно использовать для продумывания архитектуры системы. Особенно если мы говорим о архитектуре уровня ERP или, например, доработок типовых конфигураций. Существующие слои предлагается использовать в следующей интерпритации.

Исходный код на [DSL](dsl)

### L1 - System Context (System Landscape) - Интеграционный ландшафт

Слой, на котором отображается как система взаимодействует с пользователями и другими внешними системами. По умолчанию в системный контекст входят только пользователи и системы, которые непосредственно взаимодействуют с основной системой. Если нам нужно видеть системы и пользователей, которые влияют на систему опосредованно, можно использовать вид System Landscape (Системный ландшафт), в котором будут отображены все системы, описанные в модели.
[Описание кода L1](docs/L1SystemContext.md)

<details><summary>Пример диаграммы системного контекста сгенерированной Structurizr</summary>

![image](docs/img/structurizrSystemContext.png)

</details>
<details><summary>Пример диаграммы системного контекста сгенерированной PlantUML</summary>

![image](docs/img/pumlSystemContext.png)

</details>
<details><summary>Пример диаграммы системного ландшафта сгенерированной Structurizr</summary>

![image](docs/img/structurizrSystemLandscape.png)

</details>
<details><summary>Пример диаграммы системного ландшафта сгенерированной PlantUML</summary>

![image](docs/img/pumlSystemLandscape.png)

</details>

### L2 - Container - Подсистемы

В рамках описания архитектуры системы на платформе 1С контейнерами предлагается считать подсистемы конфигурации. При наличии большого количества подсистем и отсутствия требований к описанию каждой подсистемы можно объединять их в блоки (например, все подсистемы БСП в одном контейнере).
[Описание кода L2](docs/L2Container.md)

<details><summary>Пример диаграммы контейнеров (подсистем) сгенерированной Structurizr</summary>

![image](docs/img/structurizrContainer.png)

</details>
<details><summary>Пример диаграммы контейнеров (подсистем) сгенерированной PlantUML</summary>

![image](docs/img/pumlContainer.png)

</details>

### L3 - Component - Объекты конфигурации

На слое компонентов детализируется состав объектов в подсистеме и описывается их взаимодействие. Компонентом является объект метаданных.
[Описание кода L3](docs/L3Component.md)

<details><summary>Пример диаграммы компонентов (объектов) сгенерированной Structurizr</summary>

![image](docs/img/structurizrComponent.png)

</details>
<details><summary>Пример диаграммы компонентов (объектов) сгенерированной PlantUML</summary>

![image](docs/img/pumlComponent.png)

</details>

### L4 - Code - Код/Структуры данных

Не используется, но можно на этом уровне сделать принципиальное описание структуры общих модулей или ER-диаграммы объектов из слоя компонентов.

[Описание кода L4](docs/L4Code.md)

## Заимствования

[1ce-icons-for-plantuml](https://github.com/ovcharenko-di/1ce-icons-for-plantuml)
