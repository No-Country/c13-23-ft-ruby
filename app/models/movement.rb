# == Schema Information
#
# Table name: movements
#
#  id            :bigint           not null, primary key
#  balance_cents :integer          default(0)
#  beneficiary   :string
#  category      :integer
#  note          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_movements_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Movement < ApplicationRecord
  belongs_to :account
  has_one :business, through: :accounts

  def self.categorias_gastos
    { insumos: 0, servicios: 1, transporte: 2, impuestos: 3, gastos_personales: 4, otros: 5 }
  end

  def self.categorias_ingresos
    { dinero_extra: 6, salario: 7, prestamo: 8, venta: 9, otros: 10 }
  end

  def self.categorias_transferencias
    { insumos: 0, servicios: 1, transporte: 2, impuestos: 3,
      gastos_personales: 4, otros: 5, dinero_extra: 6,
      salario: 7, prestamo: 8, venta: 9 }
  end
end
