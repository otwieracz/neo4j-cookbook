# neo4j.conf
default['neo4j']['config']['neo4j.conf']['dbms.connectors.default_listen_address'] = node['ipaddress']
default['neo4j']['config']['neo4j.conf']['dbms.connector.http.enabled'] = true
default['neo4j']['config']['neo4j.conf']['dbms.connector.https.enabled'] = false
default['neo4j']['config']['neo4j.conf']['dbms.shell.enabled'] = true
default['neo4j']['config']['neo4j.conf']['dbms.shell.host'] = "127.0.0.1"
default['neo4j']['config']['neo4j.conf']['dbms.shell.port'] = "1337"
default['neo4j']['config']['neo4j.conf']['dbms.directories.import'] = "import"
default['neo4j']['config']['neo4j.conf']['dbms.connector.bolt.enabled'] = true
default['neo4j']['config']['neo4j.conf']['dbms.windows_service_name'] = "neo4j"
default['neo4j']['config']['neo4j.conf']['dbms.security.auth_enabled'] = false
default['neo4j']['config']['neo4j.conf']['dbms.directories.import'] = "import"

default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.additional'] = %w(
  -Djdk.tls.ephemeralDHKeySize=2048
  -Dunsupported.dbms.udc.source=tarball
  -XX:+AlwaysPreTouch
  -XX:+CMSClassUnloadingEnabled
  -XX:+DisableExplicitGC
  -XX:+TrustFinalNonStaticFields
  -XX:+UnlockExperimentalVMOptions
  -XX:+UseConcMarkSweepGC
  -XX:+UseG1GC
  -XX:-OmitStackTraceInFastThrow
  -XX:hashCode=5
)

### for SSL, port this from older version:
# default['neo4j']['config']['neo4j.conf']['dbms.connector.https.enabled'] = false
# default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.cert.location'] = 'conf/ssl/snakeoil.cert'
# default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.key.location'] = 'conf/ssl/snakeoil.key'
# default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.keystore.location'] = 'data/keystore'

# neo4j-server.properties
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.database.location'] = node['neo4j']['data_dir']

# neo4j.properties
default['neo4j']['config']['neo4j.properties']['logical_log'] = ::File.join(node['neo4j']['log_dir'], 'logical.log')

default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.pidfile'] = node['neo4j']['pid_file']
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.name'] = 'neo4j'
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.user'] = 'neo4j'

# logging.properties
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.pattern'] = ::File.join(node['neo4j']['log_dir'], 'neo4j.%u.%g.log')
