object DataModuleScript: TDataModuleScript
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 356
  Width = 404
  object DelphiWebScript: TDelphiWebScript
    Left = 40
    Top = 16
  end
  object dwsDebugger: TdwsDebugger
    Left = 40
    Top = 160
  end
  object dwsRTTIConnector: TdwsRTTIConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 112
  end
  object dwsGUIFunctions: TdwsGUIFunctions
    Left = 40
    Top = 208
  end
  object dwsComConnector: TdwsComConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 64
  end
  object dwsUnitDelphiAST: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'TSyntaxNode'
        Fields = <
          item
            Name = 'FParentNode'
            DataType = 'TSyntaxNode'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetType'
            ResultType = 'TSyntaxNodeType'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCol'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLine'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasChildren'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasAttributes'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'HasAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsTSyntaxNodeMethodsHasAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'GetChildNodeCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetChildCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeKeyCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'String'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeKeyEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TSyntaxNode'
            OnEval = dwsTSyntaxNodeMethodsGetChildNodeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetParentNode'
            ResultType = 'TSyntaxNode'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Col'
            DataType = 'Integer'
            ReadAccess = 'GetCol'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
            ReadAccess = 'GetLine'
          end
          item
            Name = 'Type'
            DataType = 'TSyntaxNodeType'
            ReadAccess = 'GetType'
          end
          item
            Name = 'HasChildren'
            DataType = 'Boolean'
            ReadAccess = 'GetHasChildren'
          end
          item
            Name = 'HasAttributes'
            DataType = 'Boolean'
            ReadAccess = 'GetHasAttributes'
          end
          item
            Name = 'AttributeKeyCount'
            DataType = 'Integer'
            ReadAccess = 'GetAttributeKeyCount'
          end
          item
            Name = 'ChildNodeCount'
            DataType = 'Integer'
            ReadAccess = 'GetChildNodeCount'
          end
          item
            Name = 'AttributeKey'
            DataType = 'String'
            ReadAccess = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ChildNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ParentNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetParentNode'
          end>
      end>
    Enumerations = <
      item
        Name = 'TSyntaxNodeType'
        Elements = <
          item
            Name = 'ntUnknown'
          end
          item
            Name = 'ntAdd'
          end
          item
            Name = 'ntAddr'
          end
          item
            Name = 'ntAlignmentParam'
          end
          item
            Name = 'ntAnd'
          end
          item
            Name = 'ntAnonymousMethod'
          end
          item
            Name = 'ntArguments'
          end
          item
            Name = 'ntAs'
          end
          item
            Name = 'ntAssign'
          end
          item
            Name = 'ntAt'
          end
          item
            Name = 'ntAttribute'
          end
          item
            Name = 'ntAttributes'
          end
          item
            Name = 'ntBounds'
          end
          item
            Name = 'ntCall'
          end
          item
            Name = 'ntCase'
          end
          item
            Name = 'ntCaseElse'
          end
          item
            Name = 'ntCaseLabel'
          end
          item
            Name = 'ntCaseLabels'
          end
          item
            Name = 'ntCaseSelector'
          end
          item
            Name = 'ntConstant'
          end
          item
            Name = 'ntConstants'
          end
          item
            Name = 'ntContains'
          end
          item
            Name = 'ntDeref'
          end
          item
            Name = 'ntDimension'
          end
          item
            Name = 'ntDiv'
          end
          item
            Name = 'ntDot'
          end
          item
            Name = 'ntDownTo'
          end
          item
            Name = 'ntElement'
          end
          item
            Name = 'ntElse'
          end
          item
            Name = 'ntEmptyStatement'
          end
          item
            Name = 'ntEnum'
          end
          item
            Name = 'ntEqual'
          end
          item
            Name = 'ntExcept'
          end
          item
            Name = 'ntExceptionHandler'
          end
          item
            Name = 'ntExports'
          end
          item
            Name = 'ntExpression'
          end
          item
            Name = 'ntExpressions'
          end
          item
            Name = 'ntFDiv'
          end
          item
            Name = 'ntField'
          end
          item
            Name = 'ntFields'
          end
          item
            Name = 'ntFinalization'
          end
          item
            Name = 'ntFinally'
          end
          item
            Name = 'ntFor'
          end
          item
            Name = 'ntFrom'
          end
          item
            Name = 'ntGeneric'
          end
          item
            Name = 'ntGoto'
          end
          item
            Name = 'ntGreater'
          end
          item
            Name = 'ntGreaterEqual'
          end
          item
            Name = 'ntGuid'
          end
          item
            Name = 'ntIdentifier'
          end
          item
            Name = 'ntIf'
          end
          item
            Name = 'ntImplementation'
          end
          item
            Name = 'ntImplements'
          end
          item
            Name = 'ntIn'
          end
          item
            Name = 'ntIndexed'
          end
          item
            Name = 'ntInherited'
          end
          item
            Name = 'ntInitialization'
          end
          item
            Name = 'ntInterface'
          end
          item
            Name = 'ntIs'
          end
          item
            Name = 'ntLabel'
          end
          item
            Name = 'ntLHS'
          end
          item
            Name = 'ntLiteral'
          end
          item
            Name = 'ntLower'
          end
          item
            Name = 'ntLowerEqual'
          end
          item
            Name = 'ntMethod'
          end
          item
            Name = 'ntMod'
          end
          item
            Name = 'ntMul'
          end
          item
            Name = 'ntName'
          end
          item
            Name = 'ntNamedArgument'
          end
          item
            Name = 'ntNotEqual'
          end
          item
            Name = 'ntNot'
          end
          item
            Name = 'ntOr'
          end
          item
            Name = 'ntPackage'
          end
          item
            Name = 'ntParameter'
          end
          item
            Name = 'ntParameters'
          end
          item
            Name = 'ntPath'
          end
          item
            Name = 'ntPositionalArgument'
          end
          item
            Name = 'ntProtected'
          end
          item
            Name = 'ntPrivate'
          end
          item
            Name = 'ntProperty'
          end
          item
            Name = 'ntPublic'
          end
          item
            Name = 'ntPublished'
          end
          item
            Name = 'ntRaise'
          end
          item
            Name = 'ntRead'
          end
          item
            Name = 'ntRepeat'
          end
          item
            Name = 'ntRequires'
          end
          item
            Name = 'ntReturnType'
          end
          item
            Name = 'ntRHS'
          end
          item
            Name = 'ntRoundClose'
          end
          item
            Name = 'ntRoundOpen'
          end
          item
            Name = 'ntSet'
          end
          item
            Name = 'ntShl'
          end
          item
            Name = 'ntShr'
          end
          item
            Name = 'ntStatement'
          end
          item
            Name = 'ntStatements'
          end
          item
            Name = 'ntSub'
          end
          item
            Name = 'ntSubrange'
          end
          item
            Name = 'ntThen'
          end
          item
            Name = 'ntTo'
          end
          item
            Name = 'ntTry'
          end
          item
            Name = 'ntType'
          end
          item
            Name = 'ntTypeArgs'
          end
          item
            Name = 'ntTypeDecl'
          end
          item
            Name = 'ntTypeParams'
          end
          item
            Name = 'ntTypeSection'
          end
          item
            Name = 'ntValue'
          end
          item
            Name = 'ntVariable'
          end
          item
            Name = 'ntVariables'
          end
          item
            Name = 'ntXor'
          end
          item
            Name = 'ntUnaryMinus'
          end
          item
            Name = 'ntUnit'
          end
          item
            Name = 'ntUses'
          end
          item
            Name = 'ntWhile'
          end
          item
            Name = 'ntWith'
          end
          item
            Name = 'ntWrite'
          end>
      end>
    Functions = <
      item
        Name = 'ExportAbstractSyntaxTreeToXML'
        Parameters = <
          item
            Name = 'FileName'
            DataType = 'String'
          end>
        OnEval = dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval
      end
      item
        Name = 'GetAbstractSyntaxTree'
        Parameters = <
          item
            Name = 'InterfaceOnly'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = False
          end>
        ResultType = 'TSyntaxNode'
        OnEval = dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval
      end
      item
        Name = 'SyntaxNodeTypeToString'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval
      end
      item
        Name = 'SyntaxNodeTypeToName'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval
      end>
    UnitName = 'DelphiAST'
    StaticSymbols = False
    Left = 168
    Top = 64
  end
  object dwsUnitInternal: TdwsUnit
    Script = DelphiWebScript
    Functions = <
      item
        Name = 'WriteLn'
        Parameters = <
          item
            Name = 'Input'
            DataType = 'Variant'
          end>
        OnEval = dwsUnitInternalFunctionsWriteLnEval
      end>
    UnitName = 'EditorForm'
    StaticSymbols = False
    Left = 168
    Top = 16
  end
end
