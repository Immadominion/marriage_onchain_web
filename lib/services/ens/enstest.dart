import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:ens_dart/ens_dart.dart';
import '../../config/env_config.dart';

Future<void> main() async {
  final infuraKey = EnvConfig.infuraKey;

  final rpcUrl = 'https://mainnet.infura.io/v3/$infuraKey';
  final wsUrl = 'wss://mainnet.infura.io/ws/v3/$infuraKey';

  final client = Web3Client(
    rpcUrl,
    Client(),
    socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    },
  );

  /// ENS client
  final ens = Ens(client: client);


          // To get a base name from an address
final baseName = await ens
    .withAddress(EthereumAddress.fromHex('0x1a5cdcFBA600e0c669795e0B65c344D5A37a4d5A'))
    .getBaseName();

// The unified method tries ENS first, then falls back to Base
final name = await ens
    .withAddress(EthereumAddress.fromHex('0x1a5cdcFBA600e0c669795e0B65c344D5A37a4d5A'))
    .getName();

  // /// Get address from name
  final addr = await ens.withName('married.base.eth').getAddress();

  /// Get text record
  final textRecord = await ens.getTextRecord();

  print('name: $name'); // addr: 0x324f9307b6d26881822c7c8692eeac39791a9756
  print('addr: $addr'); // name: sea.eth
  print('textRecord: $textRecord');

  try {
    final ens = Ens(client: client);
    final address = EthereumAddress.fromHex(
      '0x16240f6655F5f9e0A4965A27f857e59c4922255A',
    );

    // First get the resolver for this address
    final resolver = await ens.withAddress(address);

    // Get the reverse record
    final name = await resolver.getName();
    print('Name: $name');

    // Verify reverse lookup
    if (name.isNotEmpty) {
      final resolvedAddress = await ens.withName(name).getAddress();
      print('Resolved Address: ${resolvedAddress.hex}');
    }
  } catch (e) {
    print('Error: $e');
    // Add more detailed error information
    print('Stack trace: ${e.toString()}');
  } finally {
    client.dispose();
  }
}
