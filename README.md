# Пример описания архитектуры системы 1С по модели C4

[![License](https://img.shields.io/github/license/ivanmolodec/c4-1c-example?style=badge)](https://github.com/ivanmolodec/c4-1c-example/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/ivanmolodec/c4-1c-example.svg?label=Github%20%E2%98%85&a)](https://github.com/ivanmolodec/c4-1c-example/stargazers)
[![GitHub issues](https://img.shields.io/github/issues-raw/ivanmolodec/c4-1c-example?style=badge)](https://github.com/ivanmolodec/c4-1c-example/issues)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.neocities.org/badges/4/810243719.json)](https://openyellow.notion.site/openyellow/24727888daa641af95514b46bee4d6f2?p=28092b301c0640c0aebaaee53846692c&amp;pm=s)

## Диаграммы как код

Подход является составной частью принципа "Архитектура как код", позволяя создавать несколько диаграмм архитектуры программного обеспечения из единой модели при помощи программных языков моделирования. Одной из таких моделей является [C4 (Context Container Component Code)](https://c4model.com/). Данный пример реализован на двух программных языках моделирования: [DSL Structurizr](https://structurizr.com/dsl) и [PUML](https://plantuml.com/).

## Модель C4

Модель С4 довольно трудно полноценно использовать для продумывания архитектуры системы. Особенно если мы говорим о архитектуре уровня ERP или, например, доработок типовых конфигураций. Существующие слои предлагается использовать в следующей интерпритации.

- Исходный код на [DSL](dsl)
- Исходный код на [PUML](puml)

### L1 - System Context (System Landscape) - Интеграционный ландшафт

Слой, на котором отображается как система взаимодействует с пользователями и другими внешними системами. По умолчанию в системный контекст входят только пользователи и системы, которые непосредственно взаимодействуют с основной системой. Если нам нужно видеть системы и пользователей, которые влияют на систему опосредованно, можно использовать вид System Landscape (Системный ландшафт), в котором будут отображены все системы, описанные в модели.
[Описание кода L1](docs/L1SystemContext.md)

<details><summary>Пример диаграммы системного контекста сгенерированной Structurizr</summary>

![image](docs/img/structurizrSystemContext.png)

</details>
<details><summary>Пример диаграммы системного контекста сгенерированной PlantUML</summary>

![image](out/SystemContext.svg)

</details>
<details><summary>Пример диаграммы системного ландшафта сгенерированной Structurizr</summary>

![image](docs/img/structurizrSystemLandscape.png)

</details>
<details><summary>Пример диаграммы системного ландшафта сгенерированной PlantUML</summary>

![image](out/SystemLandscape.svg)

</details>

<details><summary>Еще один пример диаграммы системного ландшафта сгенерированной PlantUML с детальным описанием</summary>

![Посмотреть пример](example-system-landscape-c4-puml/ExcampleSystemLandscape.md)

</details>

### L2 - Container - Подсистемы

В рамках описания архитектуры системы на платформе 1С контейнерами предлагается считать подсистемы конфигурации. При наличии большого количества подсистем и отсутствия требований к описанию каждой подсистемы можно объединять их в блоки (например, все подсистемы БСП в одном контейнере).
[Описание кода L2](docs/L2Container.md)

<details><summary>Пример диаграммы контейнеров (подсистем) сгенерированной Structurizr</summary>

![image](docs/img/structurizrContainer.png)

</details>
<details><summary>Пример диаграммы контейнеров (подсистем) сгенерированной PlantUML</summary>

![image](out/Container.svg)

</details>

### L3 - Component - Объекты конфигурации

На слое компонентов детализируется состав объектов в подсистеме и описывается их взаимодействие. Компонентом является объект метаданных.
[Описание кода L3](docs/L3Component.md)

<details><summary>Пример диаграммы компонентов (объектов) сгенерированной Structurizr</summary>

![image](docs/img/structurizrComponent.png)

</details>
<details><summary>Пример диаграммы компонентов (объектов) сгенерированной PlantUML</summary>

![image](out/Component.svg)

</details>

### L4 - Code - Код/Структуры данных

Не используется, но можно на этом уровне сделать принципиальное описание структуры общих модулей или ER-диаграммы объектов из слоя компонентов.

[Описание кода L4](docs/L4Code.md)

## Дополнительные инструменты визуализации диаграмм

В случае описания небольшой системы/подсистемы можно использовать [Mermaid](https://mermaid.js.org/syntax/c4.html) - инструмент для визуализации диаграмм, ренедринг которого поддерживается напрямую в GitHub. Синтаксис похож на PUML с некоторыми отличиями и ограничениями.

```mermaid
C4Context
title Example 1C C4 - System Context

Person(SystemUser1, "Пользователь-исполнитель")
Person(SystemUser2, "Пользователь-руководитель")
System(System1C, "Система на платформе 1С")
System(OtherSystem1, "Внешняя система 1")
System(OtherSystem2, "Внешняя система 2")

Rel(OtherSystem1, System1C, "Передача данных по НСИ", "AMQP")
Rel(System1C, OtherSystem2, "Передача остатков по складам", "HTTPS")
Rel_D(SystemUser2, System1C, "Смотрит отчеты")
Rel_U(SystemUser1, System1C, "Вводит данные")

```

## Заимствования

[1ce-icons-for-plantuml](https://github.com/ovcharenko-di/1ce-icons-for-plantuml)
