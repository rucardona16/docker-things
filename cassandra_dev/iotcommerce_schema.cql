
CREATE KEYSPACE iotcommerce WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE iotcommerce.products_by_price_desc (
    id uuid,
    reference text,
    name text,
    category text,
    price double,
    client_id uuid,
    product_image text,
    PRIMARY KEY (id, reference, name, category, price, client_id)
) WITH CLUSTERING ORDER BY (reference ASC, name ASC, category ASC, price DESC, client_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX products_by_price_desc_client_id_idx ON iotcommerce.products_by_price_desc (client_id);

CREATE TABLE iotcommerce.user_ricardo (
    id uuid PRIMARY KEY,
    name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.clients_log (
    id uuid,
    nit text,
    name text,
    end_date date,
    start_date date,
    PRIMARY KEY (id, nit, name, end_date)
) WITH CLUSTERING ORDER BY (nit ASC, name ASC, end_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.products_by_price_asc (
    id uuid PRIMARY KEY,
    category text,
    client_id uuid,
    name text,
    price double,
    product_image text,
    reference text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX products_by_price_asc_name_idx ON iotcommerce.products_by_price_asc (name);
CREATE INDEX products_by_price_asc_client_id_idx ON iotcommerce.products_by_price_asc (client_id);

CREATE TABLE iotcommerce.orders_by_date_log (
    id uuid,
    order_id uuid,
    status text,
    end_date date,
    start_date date,
    PRIMARY KEY (id, order_id, status, end_date)
) WITH CLUSTERING ORDER BY (order_id ASC, status ASC, end_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.clients (
    id uuid,
    name text,
    email text,
    city text,
    clients_img text,
    clients_img_banner text,
    country text,
    nit text,
    password text,
    phone bigint,
    state text,
    PRIMARY KEY (id, name, email)
) WITH CLUSTERING ORDER BY (name DESC, email ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX clients_email_idx ON iotcommerce.clients (email);
CREATE INDEX clients_nit_idx ON iotcommerce.clients (nit);

CREATE TABLE iotcommerce.buttons_users (
    user_id uuid,
    device_mac text,
    button_type int,
    callback_email text,
    callback_name text,
    callback_phone bigint,
    clients_img text,
    product_id uuid,
    PRIMARY KEY (user_id, device_mac, button_type)
) WITH CLUSTERING ORDER BY (device_mac ASC, button_type ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX buttons_users_button_type_idx ON iotcommerce.buttons_users (button_type);

CREATE TABLE iotcommerce.buttons (
    device_mac text,
    button_type int,
    activation_ip text,
    activation_port text,
    activation_url text,
    active text,
    button_image text,
    client_id uuid,
    communication_ip text,
    communication_port text,
    communication_url text,
    PRIMARY KEY (device_mac, button_type)
) WITH CLUSTERING ORDER BY (button_type ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX buttons_client_id_idx ON iotcommerce.buttons (client_id);
CREATE INDEX buttons_button_type_idx ON iotcommerce.buttons (button_type);

CREATE TABLE iotcommerce.callback (
    id uuid PRIMARY KEY,
    callback_email text,
    callback_name text,
    callback_phone bigint,
    device_mac text,
    product_id uuid
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX callback_product_id_idx ON iotcommerce.callback (product_id);
CREATE INDEX callback_device_mac_idx ON iotcommerce.callback (device_mac);

CREATE TABLE iotcommerce.products_log (
    id uuid,
    product_id uuid,
    end_date date,
    category text,
    client_nit text,
    name text,
    price double,
    product_image blob,
    reference text,
    start_date date,
    PRIMARY KEY (id, product_id, end_date)
) WITH CLUSTERING ORDER BY (product_id ASC, end_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.ruser (
    id uuid,
    name text,
    id2 uuid,
    name2 text,
    PRIMARY KEY (id, name, id2)
) WITH CLUSTERING ORDER BY (name ASC, id2 ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.buttons_log (
    id uuid,
    device_mac text,
    client_nit text,
    end_date date,
    button_type text,
    start_date date,
    PRIMARY KEY (id, device_mac, client_nit, end_date)
) WITH CLUSTERING ORDER BY (device_mac ASC, client_nit ASC, end_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.buttons_users_log (
    user_id uuid,
    device_mac text,
    product_id uuid,
    end_date date,
    id uuid,
    start_date date,
    PRIMARY KEY (user_id, device_mac, product_id, end_date)
) WITH CLUSTERING ORDER BY (device_mac ASC, product_id ASC, end_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.users_log (
    id timeuuid,
    end_date date,
    user_id uuid,
    document_type text,
    id_number text,
    email text,
    phone_number bigint,
    phone_mac text,
    address text,
    name text,
    start_date date,
    PRIMARY KEY (id, end_date, user_id, document_type, id_number, email, phone_number, phone_mac)
) WITH CLUSTERING ORDER BY (end_date DESC, user_id DESC, document_type ASC, id_number DESC, email ASC, phone_number ASC, phone_mac ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE iotcommerce.orders_by_date (
    id uuid,
    order_date timestamp,
    user_id uuid,
    product_reference text,
    product_name text,
    city text,
    client_id uuid,
    device_mac text,
    id_number_client text,
    price double,
    product_id uuid,
    product_image text,
    shipping_address text,
    status text,
    PRIMARY KEY (id, order_date, user_id, product_reference, product_name)
) WITH CLUSTERING ORDER BY (order_date DESC, user_id ASC, product_reference ASC, product_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX orders_by_date_user_id_idx ON iotcommerce.orders_by_date (user_id);
CREATE INDEX orders_by_date_client_id_idx ON iotcommerce.orders_by_date (client_id);
CREATE INDEX orders_by_date_status_idx ON iotcommerce.orders_by_date (status);

CREATE TABLE iotcommerce.users (
    id uuid PRIMARY KEY,
    address text,
    city text,
    country text,
    document_type text,
    email text,
    id_number text,
    lastname text,
    name text,
    neighborhood text,
    password text,
    phone_mac text,
    phone_number bigint,
    state text,
    tyc boolean
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX users_phone_number_idx ON iotcommerce.users (phone_number);
CREATE INDEX users_email_idx ON iotcommerce.users (email);
CREATE INDEX users_id_number_idx ON iotcommerce.users (id_number);

