class ServiceModel {
  String? imSdkAppId;
  String? server;
  String? websit;
  String? imSdkKey;
  bool? isCrypto;
  String? publicKey;

  ServiceModel(
      {this.imSdkAppId,
      this.server,
      this.websit,
      this.imSdkKey,
      this.isCrypto,
      this.publicKey});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    imSdkAppId = json['imSdkAppId'];
    server = json['server'];
    websit = json['websit'];
    imSdkKey = json['imSdkKey'];
    isCrypto = json['isCrypto'];
    publicKey = json['publicKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imSdkAppId'] = imSdkAppId;
    data['server'] = server;
    data['websit'] = websit;
    data['imSdkKey'] = imSdkKey;
    data['isCrypto'] = isCrypto;
    data['publicKey'] = publicKey;
    return data;
  }
}

final class Config {
  static Map<String, ServiceModel> get baseMap => {
        'test': ServiceModel(
          imSdkAppId: '1400804899',
          imSdkKey:
              '8eb530d3ee8ef0fbe7f135bcba54fedb471cef81b67b4cca910f97ae45f9b530',
          isCrypto: false,
          publicKey:
              '026c76036b9573b36b6a388d6281f3b45b175029e413c7ea45416cdae39d23ef73',
          server: 'https://testai.hunanjiyun.com',
          websit: 'https://ichaodev.hunanjiyun.com',
        ),
        'pre': ServiceModel(
          imSdkAppId: '1400810760',
          imSdkKey:
              'edaf61b39f803bf14892f35725d03f416d8a64017245da1ed3a8c7590c843f37',
          isCrypto: false,
          publicKey:
              '0302277d3a326bf9d3f4b622aa04bfdd06188cc95c2b66273b4d7a47edd09f2a6b',
          server: 'https://api.aix.art',
          websit: 'https://app.aix.art',
        ),
        'prod': ServiceModel(
          imSdkAppId: '1400810760',
          imSdkKey:
              'edaf61b39f803bf14892f35725d03f416d8a64017245da1ed3a8c7590c843f37',
          isCrypto: false,
          publicKey:
              '0302277d3a326bf9d3f4b622aa04bfdd06188cc95c2b66273b4d7a47edd09f2a6b',
          server: 'https://api.yanjie.art',
          websit: 'https://www.yanjie.art',
        ),
      };

  /// 获取基础配置
  static ServiceModel get base =>
      baseMap['test'] ??
      ServiceModel(
        imSdkAppId: '1400804899',
        imSdkKey:
            '8eb530d3ee8ef0fbe7f135bcba54fedb471cef81b67b4cca910f97ae45f9b530',
        isCrypto: false,
        publicKey:
            '026c76036b9573b36b6a388d6281f3b45b175029e413c7ea45416cdae39d23ef73',
        server: 'https://testai.hunanjiyun.com',
        websit: 'https://ichaodev.hunanjiyun.com',
      );
}
