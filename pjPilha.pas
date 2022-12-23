unit pjPilha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uControleProdutos, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edCodigo: TLabeledEdit;
    edDescricao: TLabeledEdit;
    edValor: TLabeledEdit;
    btAddFilha: TBitBtn;
    btRetiraPilha: TBitBtn;
    mePilha: TMemo;
    btPesquisar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btAddFilhaClick(Sender: TObject);
    procedure btRetiraPilhaClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
  private
    FEstruturaProdutos: TEstruturaProdutos;

    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.btAddFilhaClick(Sender: TObject);
begin
  if FEstruturaProdutos.IncluirProduto(StrToIntDef(edCodigo.Text,0), edDescricao.Text, StrToFloatDef(edValor.Text,0)) then
  begin
    mePilha.Clear;
    mePilha.Lines.AddStrings(FEstruturaProdutos.CarregarProdutos);
    LimpaCampos();
  end;
end;

procedure TForm1.btRetiraPilhaClick(Sender: TObject);
begin
  if FEstruturaProdutos.RemoveProduto() then
  begin
    mePilha.Clear;
    mePilha.Lines.AddStrings(FEstruturaProdutos.CarregarProdutos);
  end
  else
    Application.MessageBox('Pilha vazia.', 'Aviso', MB_OK + MB_ICONWARNING);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FEstruturaProdutos := TEstruturaProdutos.Create;
  mePilha.Lines.Clear;
  LimpaCampos();
end;

procedure TForm1.LimpaCampos;
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edValor.Clear;
end;

procedure TForm1.btPesquisarClick(Sender: TObject);
begin
  if StrToIntDef(edCodigo.Text,0) > 0 then
  begin
    mePilha.Lines.Clear;
    mePilha.Lines.AddStrings(FEstruturaProdutos.PesquisaCodigo(StrToIntDef(edCodigo.Text,0)));
  end;
end;

end.
