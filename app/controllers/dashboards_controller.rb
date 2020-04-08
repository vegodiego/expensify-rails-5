class DashboardsController < ApplicationController
  
  def index
    
    ## Today, yesterday
  
    today=DateTime.now
    yesterday= today << 1
    @today=0
    Expense.all.each do |i|
      if i.created_at.strftime("%B") == today.strftime("%B") && i.created_at.strftime("%Y") == today.strftime("%Y") && i.created_at.strftime("%d") == today.strftime("%d")
        @today+=i.amount
      end 
    end
    @yesterday=0
    Expense.all.each do |i|
      if i.created_at.strftime("%B") == today.strftime("%B") && i.created_at.strftime("%Y") == today.strftime("%Y") && i.created_at.strftime("%d") == yesterday.strftime("%d")
        @yesterday+=i.amount
      end 
    end


    ## Gráfico ultimos seis meses
    @purchase=[0,0,0,0,0,0] 
    @withdrawal=[0,0,0,0,0,0] 
    @transfer=[0,0,0,0,0,0] 
    @payment=[0,0,0,0,0,0]  
    @datesMonth=[[DateTime.now.strftime("%B"),DateTime.now.strftime("%Y"),DateTime.now.strftime("%b")]]

    i=1
    while i<6
      date = DateTime.now << i
      @datesMonth.push([date.strftime("%B"),date.strftime("%Y"),date.strftime("%b")]) 
      i+=1
    end
    @datesMonth = @datesMonth.reverse
  
    Expense.all.each do |i|
      if i.created_at.strftime("%Y")==@datesMonth[0][1] && i.created_at.strftime("%B")==@datesMonth[0][0] 
        if i.kind=="Purchase"
          @purchase[0]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[0]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[0]+=i.amount
        elsif i.kind=="Payment"
          @payment[0]+=i.amount
        end
      elsif i.created_at.strftime("%Y")==@datesMonth[1][1] && i.created_at.strftime("%B")==@datesMonth[1][0]
        if i.kind=="Purchase"
          @purchase[1]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[1]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[1]+=i.amount
        elsif i.kind=="Payment"
          @payment[1]+=i.amount
        end
      elsif i.created_at.strftime("%Y")==@datesMonth[2][1] && i.created_at.strftime("%B")==@datesMonth[2][0]
        if i.kind=="Purchase"
          @purchase[2]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[2]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[2]+=i.amount
        elsif i.kind=="Payment"
          @payment[2]+=i.amount
        end
      elsif i.created_at.strftime("%Y")==@datesMonth[3][1] && i.created_at.strftime("%B")==@datesMonth[3][0]
        if i.kind=="Purchase"
          @purchase[3]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[3]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[3]+=i.amount
        elsif i.kind=="Payment"
          @payment[3]+=i.amount
        end
      elsif i.created_at.strftime("%Y")==@datesMonth[4][1] && i.created_at.strftime("%B")==@datesMonth[4][0]
        if i.kind=="Purchase"
          @purchase[4]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[4]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[4]+=i.amount
        elsif i.kind=="Payment"
          @payment[4]+=i.amount
        end
      elsif i.created_at.strftime("%Y")==@datesMonth[5][1] && i.created_at.strftime("%B")==@datesMonth[5][0]
        if i.kind=="Purchase"
          @purchase[5]+=i.amount
        elsif i.kind=="Withdrawal"
          @withdrawal[5]+=i.amount
        elsif i.kind=="Transfer"
          @transfer[5]+=i.amount
        elsif i.kind=="Payment"
          @payment[5]+=i.amount
        end
      end 
    end

    ## Gráfico Por día
    datesDay=[]
    Expense.all.each do |i|
      if i.created_at.strftime("%B") == DateTime.now.strftime("%B")
        datesDay.push(i)
      end
    end

    @purchases=[]
    @withdrawals=[]
    @transfers=[]
    @payments=[]

    datesDay.each do |i|
      if i.kind=="Purchase"
        @purchases.push(i)
      elsif i.kind=="Withdrawal"
        @withdrawals.push(i)
      elsif i.kind=="Transfer"
        @transfers.push(i)
      elsif i.kind=="Payment"
        @payments.push(i)
      end
    end


    ## Gráfico Por categoría
    @category=[[0,"Restaurants"],[0,"Grocery"],[0,"Car"],[0,"Services"],[0,"Home"],[0,"Education"],[0,"Fun"],[0,"Travel"]]
    Expense.all.each do |i|
      if i.created_at.strftime("%B") == DateTime.now.strftime("%B")
        if i.category == "Restaurants"
          @category[0][0]+=i.amount
        elsif i.category == "Grocery"
          @category[1][0]+=i.amount
        elsif i.category == "Car"
          @category[2][0]+=i.amount
        elsif i.category == "Services"
          @category[3][0]+=i.amount
        elsif i.category == "Home"
          @category[4][0]+=i.amount
        elsif i.category == "Education"
          @category[5][0]+=i.amount
        elsif i.category == "Fun"
          @category[5][0]+=i.amount
        elsif i.category == "Travel"
          @category[6][0]+=i.amount
        end
      end
    end

    ## Gráfico Acumulado
    @actualMonth=[]
    @lastMonth=[]

    acumulateActualMonth = 0
    acumulateLastMonth = 0

    actualMonth = DateTime.now
    lastMonth = actualMonth << 1

    maxDayActualMonth=Expense.all[Expense.all.length-1].created_at.strftime("%d").to_i
    
    (1..31).to_a.each do |i|
      finded = false
      j=0
      while finded == false
        if Expense.all[j].created_at.strftime("%Y") == actualMonth.strftime("%Y") && Expense.all[j].created_at.strftime("%B") == actualMonth.strftime("%B") && Expense.all[j].created_at.strftime("%d").to_i == i
          finded = true
          acumulateActualMonth+=Expense.all[j].amount
          @actualMonth.push([Expense.all[j].created_at.strftime("%d"),acumulateActualMonth])
        elsif finded == false && j == Expense.all.length-1
          @actualMonth.push([i.to_s,acumulateActualMonth])
          break
        end
        j+=1
      end
    end

    (1..31).to_a.each do |i|
      finded = false
      j=0
      while finded == false
        if Expense.all[j].created_at.strftime("%Y") == lastMonth.strftime("%Y") && Expense.all[j].created_at.strftime("%B") == lastMonth.strftime("%B") && Expense.all[j].created_at.strftime("%d").to_i == i
          finded = true
          acumulateLastMonth+=Expense.all[j].amount
          @lastMonth.push([Expense.all[j].created_at.strftime("%d"),acumulateLastMonth])
        elsif finded == false && j == Expense.all.length-1
          @lastMonth.push([i.to_s,acumulateLastMonth])
          break
        end
        j+=1
      end
    end

  end

end
