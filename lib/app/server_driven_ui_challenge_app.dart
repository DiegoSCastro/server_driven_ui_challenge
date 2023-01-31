import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/theme/theme_config.dart';

class ServerDrivenUiChallengeApp extends StatefulWidget {
  const ServerDrivenUiChallengeApp({super.key});

  @override
  State<ServerDrivenUiChallengeApp> createState() => _ServerDrivenUiChallengeAppState();
}

class _ServerDrivenUiChallengeAppState extends State<ServerDrivenUiChallengeApp> {
  Map<String, WidgetBuilder> _routes() => {
        '/': (context) => DynamicRoute(provider: StaticRouteContentProvider(homeJson)),
        '/transactionLimitJson': (context) =>
            DynamicRoute(provider: StaticRouteContentProvider(transactionLimitJson)),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Driven Ui',
      theme: ThemeConfig.theme,
      initialRoute: '/transactionLimitJson',
      debugShowCheckedModeBanner: false,
      routes: _routes(),
    );
  }
}

var transactionLimitJson = '''
{
  "type": "Screen",
  "appBar": {
    "type": "AppBar",
    "attributes": {
      "title": "Profile",
      "elevation": 0.0,
      "backgroundColor": "#FFFFFF",
      "leading": {
        "type": "BackButton"
      }
    }
  },
  "attributes": {
    "backgroundColor": "#FFFFFF"
  },
  "child": {
    "type": "Column",
    "children": [
      {
        "type": "TransactionLimitTitle",
        "attributes": {
          "title": "Limites das transações Pix",
          "subtitle": "Vocês pode ajustar os limites de transação Pix durante o dia e no período noturno.",
          "paddingTop": 40.0        
        }
      },
      {
        "type": "Spacer"        
      },
      {
        "type": "LimitTitleInput",  
        "attributes" : {
        "title": "Limite do período diurno",
          "subtitle": "Limite máximo de transação diurna"
        } 
      },
      {
        "type": "Spacer"        
      },
      {
        "type": "LimitTitleInput",  
        "attributes" : {
        "title": "Limite do período noturno",
        "subtitle": "Limite máximo de transação noturna",
        "hasSelectTime": true
        } 
      },
      {
        "type": "Spacer"        
      },
      {
          "type": "CustomElevatedButton",
          "attributes" : {
          "label":"SALVAR",
          "backgroundColor": "#D33091",
          "horizontalPadding": 16.0,        
          "hasPop": true,        
          "popMessage":"Limite alterado com sucesso"
        }
      }, 
      {
        "type": "Container",
        "attributes" : {
        "height": 16.0
        }
      }
     
      
    ]
  }
}
''';

var homeJson = '''
{
  "type": "Screen",  
  "attributes" : {
  "backgroundColor": "#FFFFFF"
  },
  "child": {
    "type": "SingleChildScrollView",
    "child": {
      "type": "Column",
      "children": [
        {
          "type": "CustomAppBar",
          "attributes": {
            "topPadding": 80.0,
            "horizontalPadding": 16.0,
            "height": 234.0,
            "gradientTopColor": "#D33091",
            "gradientBottomColor": "#FF5CBD",
            "box1Label": "Saldo na conta",
            "box2Label": "Saldo nas caixinhas",
            "box1Value": "450,00",
            "box2Value": "1500,00",
            "showBox1": true,
            "showBox2": true
          }
        },
        {
          "type": "PaymentSection",
          "attributes": {
            "title": "Pagar",
            "horizontalPadding": 16.0,
            "verticalPadding": 20.0,
            "mainLabel": "USAR CHAVE PIX",
            "mainLabelColor": "#D33091",
            "mainDescription": "CPF/CNPJ, e-mail, telefone ou outra chave",
            "mainIcon": "key",
            "mainIconColor": "#D33091"
          },
          "children": [
            {
              "type": "SectionIconButton",
              "attributes": {
                "label": "Ler QR CODE",
                "icon": "qr_code",
                "iconColor": "#D33091"
              }
            },
            {
              "type": "Container",
              "attributes": {
                "width": 16.0
              }
            },
            {
              "type": "SectionIconButton",
              "attributes": {
                "label": "Pix Copia e Cola",
                "icon": "copy",
                "iconColor": "#D33091"
              }
            },
            {
              "type": "Container",
              "attributes": {
                "width": 16.0
              }
            },
            {
              "type": "SectionIconButton",
              "attributes": {
                "label": "Pagar Boleto",
                "icon": "money",
                "iconColor": "#D33091"
              }
            }
          ]
        },
        {
          "type": "PaymentSection",
          "attributes": {
            "title": "Receber",
            "horizontalPadding": 16.0,
            "verticalPadding": 20.0,
            "mainLabel": "Gerar QR Code Permanente",
            "mainLabelColor": "#2929F5",
            "mainDescription": "CPF/CNPJ, e-mail, telefone ou outra chave",
            "mainIcon": "qr_code",
            "mainIconColor": "#2929F5"
          },
          "children": [
            {
              "type": "SectionIconButton",
              "attributes": {
                "label": "Gerar QR CODE de uso único",
                "icon": "qr_code",
                "iconColor": "#2929F5"
              }
            },
            {
              "type": "Container",
              "attributes": {
                "width": 16.0
              }
            },
            {
              "type": "SectionIconButton",
              "attributes": {
                "label": "Receber com Chave Pix",
                "icon": "copy",
                "iconColor": "#2929F5"
              }
            }
          ]
        },
        {
          "type": "CustomTextIconButton",
          "attributes": {
            "label": "Transferências Agendadas",
            "labelColor": "#D33091",
            "icon": "arrow_right",
            "iconColor": "#D33091"
          }
        },
        {
          "type": "CustomTextIconButton",
          "attributes": {
            "label": "Registrar ou trazer chaves",
            "labelColor": "#D33091",
            "icon": "arrow_right",
            "iconColor": "#D33091"
          }
        },
        {
          "type": "CustomTextIconButton",
          "attributes": {
            "label": "Configurar Limites Pix",
            "labelColor": "#D33091",
            "icon": "arrow_right",
            "iconColor": "#D33091"
          },
          "action" : {
          "type": "Route",
          "url" : "route:/transactionLimitJson",
          "trackEvent": "navigate to transactionLimit"
          }
        }
      ]
    }
  }
}
''';
