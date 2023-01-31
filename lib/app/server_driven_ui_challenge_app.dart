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
        '/static': (context) => DynamicRoute(provider: StaticRouteContentProvider(staticJson)),
        '/remote': (context) => const DynamicRoute(
            provider: HttpRouteContentProvider(
                'http://10.0.2.2:8080' /* Remove endpoint - Replace it with your own */
                )),
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

var staticJson = '''
{
  "type": "Screen",
  "appBar": {
    "type": "AppBar",
    "attributes": {
      "title": "Profile"
    }
  },
  "bottomNavigationBar": {
    "type": "BottomNavigationBar",
    "attributes":{
      "background": "#1D7EDF",
      "selectedItemColor": "#ffffff",
      "unselectedItemColor": "#ffffff"
    },
    "children":[
      {
        "type": "BottomNavigationBarItem",
        "attributes": {
          "icon": "f107",
          "caption": "Home"
        },
        "action":{
          "type": "Route",
          "url": "route:/~"
        }
      },
      {
        "type": "BottomNavigationBarItem",
        "attributes": {
          "icon": "f27b",
          "caption": "Me"
        },
        "action":{
          "type": "Route",
          "url": "route:/static"
        }
      },
      {
        "type": "BottomNavigationBarItem",
        "attributes": {
          "icon": "e211",
          "caption": "Remote"
        },
        "action":{
          "type": "Route",
          "url": "route:/remote"
        }
      },
      {
        "type": "BottomNavigationBarItem",
        "attributes": {
          "icon": "ef42",
          "caption": "Chat"
        },
        "action":{
          "type": "Route",
          "url": "route:/chat"
        }
      }
    ]
  },
  "child": {
    "type": "Container",
    "attributes": {
      "padding": 20.0
          },
   "child": {
    "type": "Form",
    "attributes": {
      "id": "form",
      "padding": 10
    },
    "children": [
      {
        "type": "Input",
        "attributes": {
          "id": "first_name",
          "name": "first_name",
          "value": "Ray",
          "caption": "First Name",
          "maxLength": 30,
          "minLength": 5
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "last_name",
          "name": "last_name",
          "value": "Sponsible",
          "caption": "Last Name",
          "maxLength": 30
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "email",
          "name": "email",
          "value": "ray.sponsible@gmail.com",
          "caption": "Email *",
          "required": true,
          "type": "Email"
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "website",
          "name": "website",
          "caption": "Website",
          "type": "Url"
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "phone",
          "name": "phone",
          "type": "phone",
          "caption": "Phone",
          "required": true,
          "initialCountry": "CM",
          "value": "+237690000001"
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "age",
          "name": "age",
          "type": "age",
          "caption": "Age",
          "inputFormatterRegex": "[0-9]",
          "maxLength": 3,
          "value": "12"
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "date",
          "type": "date",
          "name": "birth_date",
          "caption": "Date of Birth"
        }
      },
      {
        "type": "Input",
        "attributes": {
          "id": "submit",
          "type": "Submit",
          "name": "submit",
          "caption": "Create Profile"
        },
        "action": {
          "type": "Command",
          "url": "https://myapp.herokuapp.com/commands/save-profile",
          "trackEvent": "create-event",
          "prompt": {
            "type": "Dialog",
            "attributes": {
              "type": "confirm",
              "title": "Confirmation",
              "message": "Are you sure you want to change your profile?"
            }
          }
        }
      }
    ]}
  },
  "attributes":{
    "id": "page.static"
  }
}
''';
