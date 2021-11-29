CREATE TABLE modules(
    id serial PRIMARY KEY ,
    name varchar(50)
);
CREATE TABLE submodules(
    id serial PRIMARY KEY,
    name varchar (50),
    module_id integer,
    foreign key (module_id)
                       REFERENCES modules(id) on delete cascade
);
--type 1 practical type2 theorical
CREATE TABLE questions(
    id serial PRIMARY KEY,
    question varchar(500),
    hint varchar(100),
    type integer,
    submodule_id integer,
    query varchar(500),
    foreign key (submodule_id)
                      REFERENCES submodules(id) on delete cascade

);

CREATE TABLE alternatives(
    id serial PRIMARY KEY,
    text varchar(100),
    correct boolean,
    question_id integer,
    foreign key (question_id)
        REFERENCES questions(id) on delete cascade
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    approved bool,
    current_module_id integer,
    last_question_id integer,
    penultimate_question_id integer,
    foreign key (current_module_id)
                   references modules(id) on delete set null,
   foreign key (last_question_id)
                   references  questions(id) on delete set null,
   foreign key (penultimate_question_id)
                   references questions(id) on delete set null
);

CREATE TABLE userquestions(
    id serial PRIMARY KEY ,
    user_id integer,
    question_id integer,
    correct bool,
    foreign key (user_id)
        references users(id) on delete cascade,
    foreign key (question_id)
        references questions(id) on delete cascade,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE usersubmodules(
    id serial PRIMARY KEY ,
    user_id integer,
    submodule_id integer,
    current_score integer,
    foreign key (user_id)
        references users(id) on delete cascade,
    foreign key (submodule_id)
        references submodules(id) on delete cascade

);