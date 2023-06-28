class ServiceModel {
  String? imSdkAppId;
  String? server;
  String? websit;
  String? imSdkKey;
  bool? isCrypto;
  String? publicKey;
  String? iosSdk;
  String? androidSdk;
  ServiceModel(
      {this.imSdkAppId,
      this.server,
      this.websit,
      this.imSdkKey,
      this.isCrypto,
      this.publicKey,
      this.iosSdk,
      this.androidSdk});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    imSdkAppId = json['imSdkAppId'];
    server = json['server'];
    websit = json['websit'];
    imSdkKey = json['imSdkKey'];
    isCrypto = json['isCrypto'];
    publicKey = json['publicKey'];
    androidSdk = json['androidSdk'];
    iosSdk = json['iosSdk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imSdkAppId'] = imSdkAppId;
    data['server'] = server;
    data['websit'] = websit;
    data['imSdkKey'] = imSdkKey;
    data['isCrypto'] = isCrypto;
    data['publicKey'] = publicKey;
    data['androidSdk'] = androidSdk;
    data['iosSdk'] = iosSdk;
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
            iosSdk:
                'jx3CoV3M7FHUR2UUYwBUZohH5Wd0oAysgRK4BLRCA5aKLBPOi1+e27Pl2msKyh4HbiwbY+Wq5PLMXMC4KcdbA8GR4ZtiEjlfm4XFjax5P9MkpDMQhqUmp86JoXabCK5+1xrmvBt1d0u35h7Q6Z6aCeTDVQnLFurHBEY5uZRaTjEYXxmeuzKC4hAM4K6y1rS4VVAKMMXGTx66enIc+yIyZ10Ck83Q5Tu0U9DWZHxgz+oGnI+j60URd8LpzLXGqQbt5ckDBnFmfow=',
            androidSdk: ''),
        'pre': ServiceModel(
            imSdkAppId: '1400810760',
            imSdkKey:
                'edaf61b39f803bf14892f35725d03f416d8a64017245da1ed3a8c7590c843f37',
            isCrypto: false,
            publicKey:
                '0302277d3a326bf9d3f4b622aa04bfdd06188cc95c2b66273b4d7a47edd09f2a6b',
            server: 'https://api.aix.art',
            websit: 'https://app.aix.art',
            iosSdk: '',
            androidSdk: ''),
        'prod': ServiceModel(
            imSdkAppId: '1400810760',
            imSdkKey:
                'edaf61b39f803bf14892f35725d03f416d8a64017245da1ed3a8c7590c843f37',
            isCrypto: false,
            publicKey:
                '0302277d3a326bf9d3f4b622aa04bfdd06188cc95c2b66273b4d7a47edd09f2a6b',
            server: 'https://api.yanjie.art',
            websit: 'https://www.yanjie.art',
            iosSdk: '',
            androidSdk: ''),
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
          iosSdk:
              'jx3CoV3M7FHUR2UUYwBUZohH5Wd0oAysgRK4BLRCA5aKLBPOi1+e27Pl2msKyh4HbiwbY+Wq5PLMXMC4KcdbA8GR4ZtiEjlfm4XFjax5P9MkpDMQhqUmp86JoXabCK5+1xrmvBt1d0u35h7Q6Z6aCeTDVQnLFurHBEY5uZRaTjEYXxmeuzKC4hAM4K6y1rS4VVAKMMXGTx66enIc+yIyZ10Ck83Q5Tu0U9DWZHxgz+oGnI+j60URd8LpzLXGqQbt5ckDBnFmfow=',
          androidSdk: '');
}
