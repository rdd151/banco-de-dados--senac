using System;
using System.Windows.Forms;

namespace Calculadora
{
    public partial class Form1 : Form
    {
        // Variáveis para guardar o estado da calculadora
        private double valorArmazenado = 0;
        private string operadorSelecionado = "";
        private bool lerNovoNumero = true;

        public Form1()
        {
            InitializeComponent();
        }

        // Método acionado por TODOS os botões numéricos (0 a 9)
        private void txtNumero_Click(object sender, EventArgs e)
        {
            // Descobre qual botão foi clicado
            Button botao = (Button)sender;

            // Se for o início de uma nova digitação ou se tiver apenas "0"
            if (lerNovoNumero || txtResultado.Text == "0")
            {
                txtResultado.Text = botao.Text;
                lerNovoNumero = false;
            }
            else
            {
                txtResultado.Text += botao.Text;
            }
        }

        // Método acionado pelos botões de operação (+, -, *, /)
        private void operador_Click(object sender, EventArgs e)
        {
            Button botao = (Button)sender;

            // Salva o valor atual e o operador clicado
            valorArmazenado = double.Parse(txtResultado.Text);
            operadorSelecionado = botao.Text;
            lerNovoNumero = true;
        }

        // Método acionado pelo botão de igual (=)
        private void btnIgual_Click(object sender, EventArgs e)
        {
            double segundoValor = double.Parse(txtResultado.Text);
            double resultado = 0;

            switch (operadorSelecionado)
            {
                case "+":
                    resultado = valorArmazenado + segundoValor;
                    break;
                case "-":
                    resultado = valorArmazenado - segundoValor;
                    break;
                case "*":
                    resultado = valorArmazenado * segundoValor;
                    break;
                case "/":
                    if (segundoValor != 0)
                    {
                        resultado = valorArmazenado / segundoValor;
                    }
                    else
                    {
                        MessageBox.Show("Não é possível dividir por zero!", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        btnLimpar_Click(sender, e);
                        return;
                    }
                    break;
                default:
                    return; // Nenhuma operação selecionada
            }

            txtResultado.Text = resultado.ToString();
            valorArmazenado = resultado;
            lerNovoNumero = true;
        }

        // Método acionado pelo botão de limpar (C)
        private void btnLimpar_Click(object sender, EventArgs e)
        {
            txtResultado.Text = "0";
            valorArmazenado = 0;
            operadorSelecionado = "";
            lerNovoNumero = true;
        }
    }
}