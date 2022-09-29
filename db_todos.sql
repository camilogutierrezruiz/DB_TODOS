CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "passrowd" varchar NOT NULL,
  "is_active" bool DEFAULT true
);

CREATE TABLE "todos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "is_active" bool DEFAULT true,
  "is_completed" bool DEFAULT false,
  "created_by" varchar(30) NOT NULL,
  "start_date" date DEFAULT 'now()',
  "end_date" date NOT NULL,
  "user_id" uuid NOT NULL
);

ALTER TABLE "todos" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

insert into users (
	id,
	name,
	email,
	passrowd,
	is_active
) values (
	'78b899c6-c61a-42ce-924b-1f96eeddd703',
	'Camilo',
	'camilo@email.com',
	'camilo123',
	true
), (
	'9c43021d-0fc8-4b75-9504-2f6075ce685b',
	'Felipe',
	'felipe@correo.com',
	'felipe1969',
	true
);


insert into todos (
	id,
	title,
	description,
	is_active,
	is_completed,
	created_by,
	end_date,
	user_id 
) values (
	'ef3dbae1-a5f2-452c-a127-bba6b5f5bf6f',
	'Cambiar HDD',
	'Ir a unilago y comprar un nuevo disco duro',
	true,
	false,
	'Admin',
	'2022/09/30',
	'78b899c6-c61a-42ce-924b-1f96eeddd703'
), (
	'cfb1163b-9dab-4cf5-b1e2-c79244d88270',
	'Terminar BDD',
	'Terminar base de consultas por paciente cronicos',
	true,
	false,
	'Admin',
	'2022/09/30',
	'78b899c6-c61a-42ce-924b-1f96eeddd703'
), (
	'66b55419-321a-498d-b455-91f741ae1b0c',
	'Conseguir empleo',
	'Trabaje, vago',
	true,
	false,
	'Admin',
	'2022/09/30',
	'9c43021d-0fc8-4b75-9504-2f6075ce685b'
);

select * from users;

update todos
	set is_completed = true
	where id = '66b55419-321a-498d-b455-91f741ae1b0c';


select * from todos;

select * from todos where is_completed = true;