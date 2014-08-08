unit classeshp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl, dSQLdbBroker;

type

  TEndereco = class
    FRua: String;
    FNro: string;
    FComplemento: string;
  end;

  TPessoa = class
    FId: integer;
    FNome: string;
    FEndereco: TEndereco;
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

  TPedidoItemsOpf = class(specialize TdGSQLdbOpf<TPedidoItemsList>)
  public
//    constructor Create; overload;
  end;

  TPedido = class
    FData: tdatetime;
    FCliente: TCliente;
    FValor: Currency;
    FPedidoItems: TPedidoItemsList;
    public
  property PedidoItemsOpf: TPedidoItemsOpf read FPedidoItems;
  end;

  TProdutoOpf = class(specialize TdGSQLdbOpf<TProduto>)
  public
//    constructor Create; overload;
  end;

  TPedidoOpf = class(specialize TdGSQLdbOpf<TPedido>)
  public
//    constructor Create; overload;
  end;



implementation

end.

