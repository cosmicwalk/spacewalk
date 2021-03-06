-- oracle equivalent source sha1 395665b2000a1b4f872eed25748e1f7b70b78904


create or replace function rhn_snapshotpkg_mod_trig_fun() returns trigger as
$$
begin
	update rhnSnapshot set modified = current_timestamp where id = new.snapshot_id;
 	return new;
end;
$$ language plpgsql;

create trigger
rhn_snapshotpkg_mod_trig
before insert or update on rhnSnapshotPackage
for each row
execute procedure rhn_snapshotpkg_mod_trig_fun();


