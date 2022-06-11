import threading

from tf.TCP_server import ThreadedTCPRequestHandler, ThreadedTCPServer
from tf.api_methods import logger
from tf.TCP_client import client_send

def init():
    pass


def main():
    HOST, PORT = "localhost", 0
    
    server = ThreadedTCPServer((HOST, PORT), ThreadedTCPRequestHandler)
    
    with server:
        ip, port = server.server_address

        server_thread = threading.Thread(target=server.serve_forever)
        
        server_thread.daemon = True
        server_thread.start()
        
        logger.info("Server is running in thread: {}".format(server_thread.name))

        client_send(ip, port, "Hello World 1")
        client_send(ip, port, "Hello World 2")
        client_send(ip, port, "Hello World 3")

        server.shutdown()
    
    return 0

if __name__ == '__main__':
    main()
