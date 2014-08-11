unit classeshp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl, dSQLdbBroker;

type

  TTelefone = class
   FNro: string;
  public
   property Nro: string read FNro write FNro;
  end;

   TTelefoneList = specialize TFPGObjectList<TTelefone>;

  TCep = class
    FCep: string;
  public
   property Cep: string read FCep write FCep;
  end;

  TUf = class
    FNome: string;
  public
   property Nome: string read FNome write FNome;
  end;

  TCidade = class
  FNome: string;
  FUf: TUf;
  public
   property Nome: string read FNome write FNome;
   property Uf: TUf read FUf write FUf;
  end;

  TLogradouro = class
    FNome: string;
    FCidade: TCidade;
  public
    property Nome: string read FNome write FNome;
    property Cidade: TCidade read FCidade write FCidade;
  end;

  //  TEnderecoTipo = enumeration;

  TEndereco = class
    FLogradoura: TLogradouro;
    FNro: string;
    FComplemento: string;
    FReferencia: string;
    FCep: TCep;
  public
    property Nome: string read FNome write FNome;
    property Cidade: TCidade read FCidade write FCidade;
  end;

  TEnderecoList = specialize TFPGObjectList<TEndereco>;

  TPessoa = class
    FId: integer;
    FNome: string;
    FEnderecoList: TEnderecoList;
    FTelefoneList: TTelefoneList;
  end;

  TCliente = class (TPessoa)
    FCredito: Boolean;
    FEnderecoEntrega: TEndereco;
    FEnderecoCobranca: TEndereco;
  end;

  TClienteJ = class (TCliente)
    FCNPJ : string;
  end;

  TClienteF = class (TCliente)
    FCPF : string;
  end;

  TProduto = class
    FDescricao: string;
    FUnidade: string;
    FPrecoUnitario: Currency;
  end;

  TPedidoItem = class
    FQuantidade: real;
    FProduto: TProduto;
  end;

  TPedidoItemsList = specialize TFPGObjectList<TPedidoItem>;

  TPedido = class
    FData: tdatetime;
    FCliente: TCliente;
    FValor: Currency;
    FPedidoItems: TPedidoItemsList;
    public
      property PedidoItems: TPedidoItemsList read FPedidoItems write FPedidoItems;
  end;

  TProdutoOpf = class(specialize TdGSQLdbOpf<TProduto>)
  public
//    constructor Create; overload;
  end;

   TPedidoItemsOpf = class(specialize TdGSQLdbOpf<TPedidoItemsList>)
  public
//    constructor Create; overload;
  end;

  TPedidoOpf = class(specialize TdGSQLdbOpf<TPedido>)
  public
//    constructor Create; overload;
  // property PedidoItemsOpf: TPedidoItemsOpf read FPedidoItems;
  end;



implementation

end.

