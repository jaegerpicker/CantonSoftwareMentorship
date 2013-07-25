use Net::WebSocket::Server;
 
Net::WebSocket::Server->new(
    listen => 8080,
    on_connect => sub {
        my ($serv, $conn) = @_;
        $conn->on(
            utf8 => sub {
                my ($conn, $msg) = @_;
                $conn->send_utf8($msg);
            },
        );
    },
)->start;
