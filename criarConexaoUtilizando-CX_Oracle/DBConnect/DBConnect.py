#Library para acessar o banco de dados do Gescom

import cx_Oracle
import re
from logging import info


class   DBConnect():
    def connect(self):
        return cx_Oracle.connect(
            user="usuario_banco",
            password="senha_banco",
            dsn="//ip_do_host/sid_banco"
        )


#Método para fazer update na quantidade de um produto em um pedido sugerido
#Método recebe um objeto update com chave/valor
    def updateSuggestedOrder(self, update): 

        query = ("UPDATE pedido_reabastecimento SET qtd_embalagem_venda_e = '{}'"   
                 "WHERE cod_produto = '{}' " 
                 "AND num_loja = '{}' " 
                 "AND cod_usuario_manut = '{}' ".format(update['quantidade'], update['codigo'], update['loja'], update['usuarioManut']))

        info(query)

        try:
            conn = self.connect()
            cur = conn.cursor()
            cur.execute(query)
            conn.commit()
        
        except Exception as error:
            print(error)

        finally:
            cur.close()
            conn.close()

#Método para deletear um produto na tabela PROD_BALANCA    
    def deleteProductScale(self, codigo):

        query = "DELETE FROM prod_balanca WHERE cod_produto = '{}'".format(codigo)
        info(query)

        try:
            conn = self.connect()
            cur = conn.cursor()
            cur.execute(query)
            conn.commit()

        except Exception as error:
            print(error)
        
        finally:
            cur.close()
            conn.close()

#Método para obter informações na tabela prod_balanca
    def obterInformacoesNaTabelaProd_Balanca(self, codigo, loja):

        query = ("SELECT cod_empresa, "  
                         "num_loja, "
                         "cod_produto, "
                         "cod_setor_balanca, "
                         "cod_teclado, "
                         "num_tecla, "
                         "num_teclado, "
                         "ind_imp_data_validade, "
                         "ind_imp_data_embalagem, "
                         "ind_venda_unidade "
                         "FROM prod_balanca WHERE num_loja = '{}' AND "
                                                 "cod_produto = '{}' ".format(codigo, loja))
        
        info(query)

        try:
            conn = self.connect()
            cur = conn.cursor()
            cur.execute(query)
            result = str(cur.fetchone())

            result1 = re.sub('[(,)]', '', result)

            queryResult = result1.split("\n")

            return queryResult
        
        except Exception as error:
            print(error)

        finally:
            cur.close()
            conn.close()

#Método para inserir um registro de tecla rápida na tabela prod_balanca
#O método recebe um produto que será inserido no banco 
    def insereRegistroDeTeclaRapida(self, produto):

        self.deleteProductScale(produto['codProduto'])

        query = ("insert into prod_balanca (cod_empresa, num_loja, cod_produto, cod_setor_balanca, cod_teclado, num_tecla, "
                                            "num_teclado, ind_imp_data_validade, ind_imp_data_embalagem, ind_venda_unidade) "
                 "values('{}', '{}', '{}', {}, {}, {}, {}, '{}', '{}', '{}')"
                 .format(produto['codEmpresa'], 
                         produto['numLoja'], 
                         produto['codProduto'], 
                         produto['setorBalanca'], 
                         produto['codTeclado'], 
                         produto['numTecla'], 
                         produto['numTeclado'], 
                         produto['indImpDataValidade'], 
                         produto['indImpDataEmbalagem'], 
                         produto['indVendaUnidade']))

        info(query)

        try:
            conn = self.connect()
            cur = conn.cursor()
            cur.execute(query)
            conn.commit()
        
        except Exception as error:
            print(error)

        finally:
            cur.close()
            conn.close()


        