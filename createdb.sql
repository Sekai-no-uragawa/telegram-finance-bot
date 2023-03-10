create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);

create table expense(
    id integer primary key,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);

insert into category (codename, name, is_base_expense, aliases)
values
    ("products", "продукты", true, "еда"),
    ("coffee", "кофе", true, ""),
    ("delivery", "доставка", true, ""),
    ('medicines', 'лекарства', false, 'аптека, таблетки'),
    ('communal_services', "комуналка", false, "жкх, ЖКХ"),
    ("cafe", "кафе", true, "ресторан, рест, мак"),
    ("transport", "общ. транспорт", true, "метро, автобус, metro"),
    ("taxi", "такси", true, "яндекс такси, yandex taxi"),
    ("phone", "телефон", false, "теле2, связь"),
    ("books", "книги", true, "литература, литра, лит-ра"),
    ("internet", "интернет", false, "инет, inet"),
    ("subscriptions", "подписки", false, "подписка"),
    ("other", "прочее", true, "");

insert into budget(codename, daily_limit) values ('base', 2000);
