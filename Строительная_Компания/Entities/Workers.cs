//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Строительная_Компания.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Workers
    {
        public int WorkerID { get; set; }
        public Nullable<int> TeamID { get; set; }
        public string WorkerName { get; set; }
        public string Position { get; set; }
    
        public virtual Teams Teams { get; set; }
    }
}
